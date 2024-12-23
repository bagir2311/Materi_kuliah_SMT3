from kivy.app import App
from kivy.uix.boxlayout import BoxLayout
from kivy.uix.popup import Popup
from kivy.uix.label import Label
from kivy.uix.button import Button
from kivy.uix.textinput import TextInput
from kivy.animation import Animation
from kivy.core.window import Window
from kivy.uix.image import Image
from kivy.utils import get_color_from_hex
from kivy.lang.builder import Builder

class InputForm(BoxLayout):
    def show_data(self):
        # Ambil data dari text input
        
        nama = self.ids.nama_input.text
        nim = self.ids.nim_input.text
        jurusan = self.ids.jurusan_input.text
        #Validasi Inputan tidak kosong
        if not nama or not nim or not jurusan:
            popup = Popup(title="Error", content=Label(text="Semua field harus diisi."), size_hint=(0.8, 0.4), auto_dismiss=True)
            popup.open()
            return
        
        # Format data untuk ditampilkan
        data = f"Nama: {nama}\nNIM: {nim}\nJurusan: {jurusan}"
    

        # Buat PopUp
        popup = Popup(
            title="Data Mahasiswa",
            content=Label(text=data), 
            size_hint=(0.8, 0.4),
            auto_dismiss=True,
        )

        # Tambahkan tombol untuk menutup pop-up
        close_btn = Button(text="Tutup", size_hint_y=None, height=40)
        close_btn.bind(on_release=popup.dismiss)
        popup.content.add_widget(close_btn)

        # Tampilkan pop-up
        popup.open()

class form(App):
    def build(self):
        self.get_color_from_hex = get_color_from_hex # Utility Warna
        return InputForm()

    def on_start(self):
        Window.size = (400, 600)
        self.title = "Formulir Pendaftaran Mahasiswa"

if __name__ == "__main__":
    form().run()