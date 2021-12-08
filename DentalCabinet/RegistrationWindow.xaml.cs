using System;
using System.Collections.Generic;
using System.Linq;
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
            Visibility Visibility = PasswordPasswordBox.Visibility;
            double Width = PasswordPasswordBox.ActualWidth;
            // Изменение подписи на кнопке
            PasswordButton.Content = Visibility == Visibility.Visible ? "Скрыть" : "Показать";
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
            // Добавление его в базу данных
            dataBase.user.Add(user);
            // Сохранение изменений
            dataBase.SaveChanges();
            Close();
        }

        private void CancelButton_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }
    }
}
