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
    /// Interaction logic for AuthorizationWindow.xaml
    /// </summary>
    public partial class AuthorizationWindow : Window
    {
        private Data.dental_dbEntities dataBase;
        public AuthorizationWindow()
        {
            InitializeComponent();
            try
            {
                dataBase = new Data.dental_dbEntities();
            }
            catch
            {
                MessageBox.Show("Не удалось подключиться к базе данных. Проверьте настройки подключения приложения.", "Предупреждение", MessageBoxButton.OK, MessageBoxImage.Warning);
                Close();
            }
        }
        private void AuthorizationCommit_Click(object sender, RoutedEventArgs e)
        {
            
            Data.user User = Data.Users.users.SingleOrDefault(U => U.login == LoginText.Text && U.password == PasswordBox.Password);
            if (User != null)
            {
                MainWindow window = new MainWindow();
                window.Show();
                Close();
            }
            else
            {
                MessageBox.Show("Неверно указан логин и/или пароль!", "Предупреждение", MessageBoxButton.OK, MessageBoxImage.Warning);
            };
        }

        private void RegistrationButton_Click(object sender, RoutedEventArgs e)
        {
            RegistrationWindow window = new RegistrationWindow(dataBase);
            window.ShowDialog();
        }

        private void AuthorizationRollBack_Click(object sender, RoutedEventArgs e)
        {
            if (MessageBox.Show("Вы действительно хотите выйти из программы?", "Внимание", MessageBoxButton.OKCancel, MessageBoxImage.Warning) == MessageBoxResult.OK)
            {
                Close();
            }
        }
    }
}
