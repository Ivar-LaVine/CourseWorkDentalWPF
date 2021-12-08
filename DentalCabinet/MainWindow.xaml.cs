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

namespace DentalCabinet
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private List<Page> ActivePages = new List<Page>();
        private int CurrentPageIndex = -1;
        public MainWindow()
        {
            InitializeComponent();
            Title = "Кабинет зубного имени Ильи Плотникова";
        }
        private void SetControlsEnabled()
        {
            PreviousPageButton.IsEnabled = (CurrentPageIndex > 0);
            NextPageButton.IsEnabled = (CurrentPageIndex < ActivePages.Count - 1);
            ClosePageButton.IsEnabled = (ActivePages.Count > 0);
        }
        private int GetActivePageIndexByType(Type PageType)
        {
            int Index = ActivePages.Count - 1;
            while ((Index >= 0) && (ActivePages[Index].GetType() != PageType))
            {
                Index--;
            }
            return Index;
        }
        private void ShowPage(Type pageType)
        {
            Page page;
            if (pageType != null)
            {
                int Index = GetActivePageIndexByType(pageType);
                if (Index < 0)
                {
                    page = (Page)Activator.CreateInstance(pageType);
                    ActivePages.Add(page);
                    CurrentPageIndex = ActivePages.Count - 1;
                }
                else
                {
                    page = ActivePages[Index];
                    CurrentPageIndex = Index;
                }
            }
            else
            {
                page = null;
            }
            MainFrame.Navigate(page);
        }

        private void DoctorsButton_Click(object sender, RoutedEventArgs e)
        {
            ShowPage(typeof(Pages.DoctorsPage));
        }

        private void PatientsButton_Click(object sender, RoutedEventArgs e)
        {
            ShowPage(typeof(Pages.PatientsPage));
        }

        private void NextPageButton_Click(object sender, RoutedEventArgs e)
        {
            CurrentPageIndex++;
            MainFrame.Navigate(ActivePages[CurrentPageIndex]);
        }

        private void PreviousPageButton_Click(object sender, RoutedEventArgs e)
        {
            CurrentPageIndex--;
            MainFrame.Navigate(ActivePages[CurrentPageIndex]);
        }

        private void ClosePageButton_Click(object sender, RoutedEventArgs e)
        {
            Page page;
            ActivePages.RemoveAt(CurrentPageIndex);
            if (CurrentPageIndex > 0)
            {
                CurrentPageIndex--;
                page = ActivePages[CurrentPageIndex];
            }
            else
            {
                if (CurrentPageIndex < ActivePages.Count)
                {
                    page = ActivePages[CurrentPageIndex];
                }
                else
                {
                    page = null;
                }
            }
            MainFrame.Navigate(page);
        }

        private void MainFrame_LoadCompleted(object sender, NavigationEventArgs e)
        {
            while (MainFrame.CanGoBack)
            {
                MainFrame.RemoveBackEntry();
            }
            SetControlsEnabled();
        }

        private void MainWindow_Loaded(object sender, RoutedEventArgs e)
        {
            SetControlsEnabled();
        }

        private void PositionsButton_Click(object sender, RoutedEventArgs e)
        {
            ShowPage(typeof(Pages.PositionsPage));
        }

        private void ServicesButton_Click(object sender, RoutedEventArgs e)
        {
            ShowPage(typeof(Pages.ServicesPage));
        }
        private void PatientsTalonsButton_Click(object sender, RoutedEventArgs e)
        {
            ShowPage(typeof(Pages.PatientsTalonsPage));
        }
        private void CloseWindowButton_Click(object sender, RoutedEventArgs e) => Close();

        
    }
}
