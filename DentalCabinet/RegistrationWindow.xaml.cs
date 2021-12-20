using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace DentalCabinet
{
    /// <summary>
    /// Interaction logic for RegistrationWindow.xaml
    /// </summary>
    public partial class RegistrationWindow : Window
    {
        public RegistrationWindow()
        {
            InitializeComponent();
        }

        private void PasswordButton_Click(object sender, RoutedEventArgs e)

        {
            // Переброска необходимой информации во временные буферы
            String Password = PasswordPasswordBox.Password;
            // Переброска информации из TextBox'а в PasswordBox
            PasswordPasswordBox.Password = PasswordTextBox.Text;
            PasswordPasswordBox.Visibility = PasswordTextBox.Visibility;
            PasswordPasswordBox.Width = PasswordTextBox.Width;
            // Возврат информации из временных буферов в TextBox
            PasswordTextBox.Text = Password;
            PasswordTextBox.Visibility = Visibility;
            PasswordTextBox.Width = Width;
        }

        // Контекст бызы данных

        private Data.dental_dbEntities dataBase;

        public RegistrationWindow(Data.dental_dbEntities Database)

        {
            InitializeComponent();
            this.dataBase = Database;
        }

        private void OkButton_Click(object sender, RoutedEventArgs e)
        {
            // Создание и инициализация нового пользователя системы
            Data.user user = new Data.user();
            user.login = LoginTextBox.Text;
            user.password = PasswordPasswordBox.Password != "" ? PasswordPasswordBox.Password : PasswordTextBox.Text;
            try
            {
                // Проверка на уникальность логина
                List<Data.user> usersList = dataBase.user.ToList();
                foreach (Data.user u in usersList)
                {
                    if (u.login == user.login)
                    {
                        // Возбуждение исключения в случае нахождения такого же логина
                        throw new LoginException();
                    }
                }
                // Добавление пользователя в базу данных
                dataBase.user.Add(user);
                // Сохранение изменений
                dataBase.SaveChanges();
                // Закрытие окна
                Close();
            } 
            catch(LoginException)
            {
                MessageBox.Show("Такой логин уже существует", "Предупреждение", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
            catch
            {
                MessageBox.Show("Не удалось зарегистрировать нового пользователя", "Предупреждение", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }

        private void CancelButton_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }

        [Serializable]
        private class LoginException : Exception
        {
            public LoginException()
            {

            }

            public LoginException(string message) : base(message)
            {

            }
        }
    }
}
