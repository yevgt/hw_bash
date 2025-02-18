#!/bin/bash
#
# Запрос адресс страницы у пользователя
read -p "Enter the address to ping: " address
#
# Счетчик попыток
fail_count=0
# запускаем бесконечный цикл
while true; do
# Perform the ping and extract the time
  ping_result=$(ping -c 1 $address ) # выполнение одного пакета пинга адресса
  
  if [[ -z $ping_result ]]; then
    # если пинг не выполнился. увеличиваем счетчик на 1
    ((fail_count++))
    echo "Ping failed. Consecutive failures: $fail_count"
  else
    # время ответа пинга
    ping_time=$(echo $ping_result | awk -F'time=' '{print $2}' | awk '{print $1}')
    # проверка условия больше 100 и сравнение числа с плавающей точкой
    if (( $(echo "$ping_time > 100" | bc -l) )); then
      echo "Ping time exceeds 100 ms: $ping_time ms"
    else
      # обнуляем счетчик при успешном пинге
      fail_count=0
    fi
  fi

  # если счетчик неудачных попыток больше или равен 3 прерываем цикл while
  if (( fail_count >= 3 )); then
    echo "Ping failed for 3 consecutive attempts."
    break
  fi
done
