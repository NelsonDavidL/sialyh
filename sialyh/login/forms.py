from django import forms


#Este es el formulario del Login
class formLogin(forms.Form):

    Usuario=forms.CharField()
    Contraseña=forms.CharField(widget=forms.PasswordInput)


class formRemPass(forms.Form):

    Usuario = forms.CharField(
        label="Por favor indique su usuario"
    )