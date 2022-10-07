#include "freertos/FreeRTOS.h"
#include "esp_wifi.h"
#include "esp_system.h"
#include "esp_event.h"
#include "esp_event_loop.h"
#include "nvs_flash.h"
#include "driver/gpio.h"

int delay = 600;

static void pulse_pin(int pin)
{
    gpio_set_level(pin, 0);
    vTaskDelay(80 / portTICK_PERIOD_MS);
    gpio_set_level(pin, 1);
    vTaskDelay(delay / portTICK_PERIOD_MS);
}

static void configure_gpio(int pin)
{
    gpio_reset_pin(pin);
    gpio_set_direction(pin, GPIO_MODE_OUTPUT);
}


void app_main(void)
{
	configure_gpio(1);
	configure_gpio(2);
	configure_gpio(3);
	configure_gpio(4);

	int decr = 40;

	while (1)
	{
		pulse_pin(1);
		pulse_pin(2);
		pulse_pin(3);
		pulse_pin(4);

		delay -= decr;


		if ( delay < 80 )
			decr = 10;

		if ( delay < 0 )
		{
			decr = 40;
			delay = 600;

		}
	}
}

