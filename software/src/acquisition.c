#include "acquisition.h"
#include <arv.h>
#include <stdlib.h>
#include <stdio.h>

typedef struct {
	GMainLoop *main_loop;
	guint32 counter;
} ACQ_data;


static void ACQ_NewFrame_CB (ArvStream *stream, void *user_data)
{
	ArvBuffer *buffer;
	ACQ_data *app_data = user_data;
	FILE *fp;
	char fileName[32];

	/* This code is called from the stream receiving thread, which means all the time spent there is less time
	 * available for the reception of incoming packets */

	buffer = arv_stream_pop_buffer (stream);

	/* Display some informations about the retrieved buffer */
	printf ("Acquired %d×%d buffer\n",
		arv_buffer_get_image_width (buffer),
		arv_buffer_get_image_height (buffer));

	sprintf(fileName, "out/frame_%i.raw", app_data->counter);
	fp = fopen(fileName, "w");
	fwrite(buffer, 1, 125*125, fp);
	fclose(fp);

	/* Don't destroy the buffer, but put it back into the buffer pool */
	arv_stream_push_buffer (stream, buffer);

	app_data->counter++;

	if (app_data->counter == 3)
		g_main_loop_quit (app_data->main_loop);
}


int ACQ_Init_stream()
{
	GError *error = NULL;
	ArvCamera *camera;
	ArvStream *stream;


	/* Connect to the first available camera */
	camera = arv_camera_new(NULL, &error);
	if(!ARV_IS_CAMERA(camera)) {
		printf("Error: %s\n", error->message);
		return EXIT_FAILURE;
	}
	printf ("Found camera '%s'\n", arv_camera_get_model_name(camera, NULL));

	/* Setting up the camera */
	arv_camera_set_pixel_format(camera, ARV_PIXEL_FORMAT_MONO_8, &error);
	arv_camera_set_frame_rate(camera, 60.0, &error);
	arv_camera_set_region(camera, 0, 0, 125, 125, &error);
	arv_camera_set_acquisition_mode(camera, ARV_ACQUISITION_MODE_CONTINUOUS, &error);

	/* Start Stream */
	int i;
	size_t payload;
	ACQ_data app_data;
	app_data.main_loop = g_main_loop_new (NULL, FALSE);
	app_data.counter = 0;

	stream = arv_camera_create_stream(camera, NULL, NULL, &error);
	if(!ARV_IS_STREAM(stream)) {
		printf("Error: %s\n", error->message);
		g_clear_object (&stream);
		return EXIT_FAILURE;
	}

	/* Insert some buffers to get things going */
	payload = arv_camera_get_payload(camera, &error);
	if (error == NULL) {
		for (i = 0; i < 5; i++)
			arv_stream_push_buffer(stream, arv_buffer_new(payload, NULL));
	}

	g_signal_connect(stream, "new-buffer", G_CALLBACK(ACQ_NewFrame_CB), &app_data);
	arv_stream_set_emit_signals (stream, TRUE);

	if(error == NULL)
		arv_camera_start_acquisition (camera, &error);

	if(error == NULL)
		g_main_loop_run (app_data.main_loop);

	if(error == NULL)
		arv_camera_stop_acquisition (camera, &error);

	arv_stream_set_emit_signals (stream, FALSE);

	/* Destroy the stream object */
	g_clear_object (&stream);

	return EXIT_SUCCESS;
}
