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

namespace DentalCabinet.Pages
{
    /// <summary>
    /// Interaction logic for DoctorsPage.xaml
    /// </summary>
    public partial class DoctorsPage : Page
    {
        public DoctorsPage()
        {
            InitializeComponent();
            DataContext = this;
            DoctorsDataGrid.ItemsSource = Core.CoreDB.dental_DbEntities.doctor.ToList();
        }

        private Data.doctor doctor;
        public Data.doctor Doctor
        {
            get => doctor;
            set
            {
                doctor = value;
            }
        }
        // Mode 1 - Add; 2 - Edit; 3 - Delete; 4 - New by selected
        private void AddDoctorButton_Click(object sender, RoutedEventArgs e)
        {
            Page page = new DlgPages.DoctorsDlgPage(this, new Data.doctor(), 1);
            DoctorsFrame.Navigate(page);
            DoctorsFrameColumnDefinition.Width = new GridLength(300, GridUnitType.Pixel);
            DoctorsFrameColumnDefinition.MinWidth = 300;
        }

        private void EditDoctorButton_Click(object sender, RoutedEventArgs e)
        {
            //Page page = new DlgPages.DoctorsDlgPage(this);
            //DoctorsFrame.Navigate(page);
            DoctorsFrameColumnDefinition.Width = new GridLength(300, GridUnitType.Pixel);
            DoctorsFrameColumnDefinition.MinWidth = 300;
        }

        private void DeleteDoctorButton_Click(object sender, RoutedEventArgs e)
        {
            Page page = new DlgPages.DoctorsDlgPage(this, new Data.doctor(), 3);
        }

        public void UpdateGrid(Data.doctor doctor)
        {
            if ((doctor == null) && (DoctorsDataGrid.ItemsSource != null))
            {
                doctor = (Data.doctor)DoctorsDataGrid.SelectedItem;
            }
            DoctorsDataGrid.ItemsSource = Core.CoreDB.dental_DbEntities.doctor.ToList();
            DoctorsDataGrid.SelectedItem = doctor;
        }
    }
}
