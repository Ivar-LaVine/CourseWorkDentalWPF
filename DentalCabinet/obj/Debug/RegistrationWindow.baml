   M S B A M L   `   `   `  ����H  DDentalCabinet, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null-clr-namespace:DentalCabinetDentalCabinet  5   	   &     DentalCabinet.RegistrationWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   -localclr-namespace:DentalCabinet     5   	     � Title$5  /Регистрация пользователя��5   	   $	��200��6*   $	��500��67    � 
ResizeMode$ NoResize=�5	   	    � WindowStartupLocation$ CenterScreen=�5
   	    � 	Resources 5       �� 
TargetType   ImageButtonStyle �� Property �� Value �� 
TargetType��%�   &	        �� 5   
   " ��6   .�5      ��  � �� 5      �� 5      " ��6&   .R�5      �� 5      5      5      5      .��5      � .+�5   
   ]� .+�5      �� $
��Left=�6   .+�5      �� $
��Left=�6   $��60��6.   $��60��69   $��10,20q�6E   $��dental_logo.png��6T   5      �� 5      $��
10,15,20,0q�6   .+�5      ��  �� Orientation$ 
Horizontal=�6   $
��Left=�66   .+�5      �� $��
Логин��6   $��90��6,   $��Center=�67   �� 5      -   5        	 ��Name$	 LoginTextBox��5      $��0��64   5      �� 5       $ 
Horizontal=�6   $
��Left=�66   .+�5!      �� $��Пароль��6   $��90��6-   $��Center=�68   � 5"      .+�5#      G� -   5        
 G�Name$
 PasswordPasswordBox��5#   &   $��2��6C   $	��208��6P   �� 5$      -   5        $	 PasswordTextBox��5$   "   $��0��6;   $y�Hidden=�6E   $��1��6Y   5%      � 5&      .+�5'      �� -   5        #��[  5'   !   .��5(      ��  � Cursor$
 Hand��6$   $��show_password.png��62   $��40��6M   $��Center=�6X   $��0,0,0,5q�6s   -  'System.Windows.Input.KeyboardNavigation   TabIndex$ 2��6�   5)      5*      5,      �� 5-      $ 
Horizontal=�6   $��Right=�66   .+�5.      �� -   5         ��Name$ OkButton��5.      $
��ОК��6/   $��75��6<   $��Right=�6G   $��0,0,5,0q�6^   $��3��6o    �� 	IsDefault . 6�   �� 5/      -   5        $ CancelButton��5/      $��Отмена��63   $��75��6D   $��Right=�6O   $��0,0,5,0q�6f   $��4��6w    �� IsCancel . 6�   50      51      52      53      54      