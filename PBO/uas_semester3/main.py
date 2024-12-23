from kivy.app import App
from kivy.uix.boxlayout import BoxLayout
from kivy.uix.popup import Popup
from kivy.uix.label import Label


class ParkingForm(BoxLayout):
    def submit(self):
        # Get user input
        name = self.ids.name_input.text.strip()
        phone = self.ids.phone_input.text.strip()
        date = self.ids.date_input.text.strip()
        time = self.ids.time_input.text.strip()
        license_plate = self.ids.license_plate_input.text.strip()

        # Check if all fields are filled
        if not (name and phone and date and time and license_plate):
            self.show_popup("Error", "Please fill in all fields.")
            return

        # Display booking confirmation
        confirmation = (
            f"Booking Successful!\n\n"
            f"Name: {name}\n"
            f"Phone: {phone}\n"
            f"Date: {date}\n"
            f"Time: {time}\n"
            f"License Plate: {license_plate}"
        )
        self.show_popup("Booking Confirmation", confirmation)

    def show_popup(self, title, message):
        popup = Popup(
            title=title,
            content=Label(text=message, halign="center"),
            size_hint=(0.8, 0.4),
        )
        popup.open()


class ParkingApp(App):
    def build(self):
        return ParkingForm()


if __name__ == '__main__':
    ParkingApp().run()
