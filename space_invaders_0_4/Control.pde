// Реализуем одновременное нажатие нескольких кхавиш. 
char[] command_keys = { 'a', 'ф', 'd', 'в', ' '};
boolean[] keys_pressed = new boolean[command_keys.length];

// Проверям какая клавиша нажата по массиву command_keys и записываем в массив keys_pressed булеву переменную.
void keyPressed() {
  for (int i = 0; i < command_keys.length; i++) {
    if (key == command_keys[i]) keys_pressed[i] = true;
  }
}

// Если пнока отпущена (больше не нажата), то записыаем это в булев массив
void keyReleased() {
  for (int i = 0; i < command_keys.length; i++) {
    if (key == command_keys[i]) keys_pressed[i] = false;
  }
}
