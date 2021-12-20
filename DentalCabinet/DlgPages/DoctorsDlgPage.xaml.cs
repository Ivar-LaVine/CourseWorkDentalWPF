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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace DentalCabinet.DlgPages
{
    /// <summary>
    /// Interaction logic for DoctorsDlgPage.xaml
    /// </summary>
    public partial class DoctorsDlgPage : Page
    {
        public DoctorsDlgPage(Pages.DoctorsPage doctorsPage, Data.doctor doctor, int mode)
        {
            InitializeComponent();
            DataContext = this;
            Doctor = doctor;
            DoctorsPage = doctorsPage;
            Mode = mode;
            PositionComboBox.ItemsSource = Core.CoreDB.dental_DbEntities.position.ToList();
            if (Mode == 3 && MessageBox.Show("Удалить запись?", "Внимание", MessageBoxButton.OKCancel, MessageBoxImage.Warning) == MessageBoxResult.OK)
            {
                try
                {
                    Doctor = (Data.doctor)DoctorsPage.DoctorsDataGrid.SelectedItem;
                    if (DoctorsPage.DoctorsDataGrid.SelectedIndex < DoctorsPage.DoctorsDataGrid.Items.Count - 1)
                    {
                        DoctorsPage.DoctorsDataGrid.SelectedIndex++;
                    }
                    else
                    {
                        if (DoctorsPage.DoctorsDataGrid.SelectedIndex > 0)
                        {
                            DoctorsPage.DoctorsDataGrid.SelectedIndex--;
                        }
                    }
                    Data.doctor nextDoctorCursor = (Data.doctor)DoctorsPage.DoctorsDataGrid.SelectedItem;
                    DoctorsPage.DoctorsDataGrid.SelectedItem = Doctor;
                    Core.CoreDB.dental_DbEntities.doctor.Remove(Doctor);
                    Core.CoreDB.dental_DbEntities.SaveChanges();
                    DoctorsPage.UpdateGrid(nextDoctorCursor);
                }
                catch
                {
                    MessageBox.Show("Не удалось удалить запись из базы данных", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }

        private Pages.DoctorsPage DoctorsPage;
        public Data.doctor Doctor { get; set; }

        private int Mode;
        private void OkButton_Click(object sender, RoutedEventArgs e)
        {
            if (Mode == 1)
            {
                try
                {
                    Doctor.surname = SurnameTextBox.Text;
                    Doctor.name = NameTextBox.Text;
                    Doctor.patronymic = PatronymicTextBox.Text;
                    Doctor.dob = DateTime.Parse(DOBTextBox.Text);
                    Doctor.phone = PhoneTextBox.Text;
                    Doctor.mail = MailTextBox.Text;
                    Doctor.reg_date = DateTime.Parse(RegDateTextBox.Text);
                    Doctor.position = (Data.position)PositionComboBox.SelectedItem;
                    Core.CoreDB.dental_DbEntities.doctor.Add(Doctor);
                    Core.CoreDB.dental_DbEntities.SaveChanges();
                    DoctorsPage.UpdateGrid(Doctor);
                }
                catch
                {
                    MessageBox.Show("Не удалось добавить запись в базу данных", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
            
            
        }

        private void CancelButton_Click(object sender, RoutedEventArgs e)
        {
            DoctorsPage.DoctorsFrame.Navigate(null);
            DoctorsPage.DoctorsFrameColumnDefinition.Width = new GridLength(0, GridUnitType.Pixel);
            DoctorsPage.DoctorsFrameColumnDefinition.MinWidth = 0;
        }
    }
}
