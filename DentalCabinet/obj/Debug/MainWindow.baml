   M S B A M L   `   `   `  ����H  DDentalCabinet, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null-clr-namespace:DentalCabinetDentalCabinet  5   	       DentalCabinet.MainWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   -localclr-namespace:DentalCabinet     5   	   -   5          � Title$  
MainWindow��5   	    � WindowState$ 	Maximized=�67    � WindowStyle$
 None=�6O   .��5	      �  � ColumnDefinitions 5
   
   �� 5      $	��170 �6   �� 5       � RowDefinitions 5   
   �� 5      �� 5      $��50 �6   .+�5   
   �� $��Center=�6   .+�5      �� $��dental_logo.png��6   $��	5 10 5 10q�6.   �� 5      -   5         ��Name$ DoctorsButton��5   '   $��Доктора��6   6>   �� 5      -   5        $ PatientsButton��5   (   $��Пациенты��6   6@   �� 5      -   5        $ PositionsButton��5   )   $��Должности��6   6B   �� 5      -   5        $ ServicesButton��5   &   $��Услуги��6   6>   �� 5      -   5        $ PatientsTalonsButton��5   ,   $��Регистратура��6   6J   5      �� 5   
   $��1��6   $��1��6%    �� Orientation$ 
Horizontal=�62   .+�5      �� -   5        $ PreviousPageButton��5   %   $��
Назад��6   6A   �� 5      -   5        $ NextPageButton��5   &   $��Вперед��6   6>   5      �� 5   
   -	   5        $ ClosePageButton��5   \   $��1��6   $��1��6!   $��Закрыть��6.   $��Right=�6@   6u    � 5   
   -
   5          �Name$ 	MainFrame��5       $��1��6     � NavigationUIVisibility$ Hidden=�63   5!      �� 5"   
   -   5        $ CloseWindowButton��5"   l   $��1��6   $��Right=�6!   $	��Top=�6=   $��30��6U   $��X��6`   6�   5#      5$      