   M S B A M L   `   `   `  ����H  DDentalCabinet, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null9!clr-namespace:DentalCabinet.PagesDentalCabinet.Pages  5      %    DentalCabinet.Pages.DoctorsPage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      3local!clr-namespace:DentalCabinet.Pages     5        N� Title$  DoctorsPage��5	      .��5      �  � ColumnDefinitions 5   
   �� 5      $��* �6   �� 5      $��3 �6   �� 5      -   5         ��Name$" DoctorsFrameColumnDefinition��5   8   $��0 �6   $	��400��6)   68    � RowDefinitions 5   
   �� 5      $��50 �6   �� 5      $��* �6   .+�5   
   �� $#��Список докторов��6   $��3��6*   $��26(�6>   $��Arial)�6L   ]� 5   
   -   5         ]�Name$ DoctorsDataGridDockPanel��5      $��1��66   $��0��6C   $��1��6S   .+�5      ��  �� Orientation$ 
Horizontal=�6   $	��Top=�62   $��50��6G   $��Center=�6S   .+�5      �� -   5         ��Name$ AddDoctorButton��5      $��
Новая��62   6B   �� 5      -   5        $ CopyDoctorButton��5      $��Копировать��63   �� 5      -   5        $ EditDoctorButton��5      $��Изменить��63   6F   �� 5      -   5        $ DeleteDoctorButton��5      $��Удалить��65   6G   �� 5      $	��400��6   5      &   System.Windows.Controls.DataGrid  5      -   5          Name$ DoctorsDataGrid��5         Columns 5      0  *System.Windows.Controls.DataGridTextColumn  5       ,  &System.Windows.Controls.DataGridColumn	   Header$	 Фамилия��6)   
   Width5  /System.Windows.Controls.DataGridLengthConverter$
 * 6[   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6:   ��  �� Path$ surname�6[     5!      $	 Имя��6)   $
 * 6T    66   �� $
 name�6T     5"      $	 Отчество��6)   $
 * 6_    6;   �� $ 
patronymic�6_     5#      $	 Дата рождения��6)      HeaderStringFormat$ 
dd-MM-yyyy��6|   $
 * 6�    6@   �� $	 dob� �� StringFormat$ {0:dd.MM.yyyy}��6�     5$      $	 Телефон��6)   $
 * 6Y    6:   �� $ phone�6Y     5%      $	 
Почта��6)   $
 * 6V    68   �� $
 mail�6V     5&      $	 Регистрация��6)   $	
 150 6    6>   �� $ reg_date�$ {0:dd.MM.yyyy}��6     5'      $	 Должность��6)   $
 * 6d    6<   �� $ position.title�6d   5)      5*      �� 5+   
   $��1��6   $��1��6'   $��3��64   $��Stretch=�6>   $y�Hidden=�6\    � 5,   
   -   5          �Name$ DoctorsFrame��5,   M     � NavigationUIVisibility$ Hidden=�6   $��2��60   $��1��6@   6M   5-      5.      