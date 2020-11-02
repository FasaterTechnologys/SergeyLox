String Sortmap(Map map) {
  var balance;
  if (map["result"]["address"]["balance"]["del"] != null)
    balance = (int.parse(map["result"]["address"]["balance"]["del"]) /
        1000000000000000000);
  else {
    balance = "Пусто";
  }
  String text = "Баланс: " + balance.toString() ?? "Пусто";
  text = text +
          "\nКошелек создан: " +
          map["result"]["address"]["createdAt"].toString() ??
      "Пусто";
  text = text +
          "\nПоследнее обновление: " +
          map["result"]["address"]["updatedAt"].toString() ??
      "Пусто";
  text = text + "\n\nДанные о последнем переводе";
  text = text +
          "\nПоследний перевод: " +
          map["result"]["address"]["txs"][0]["timestamp"].toString() ??
      "Пусто";
  text = text +
          "\nСтатус: " +
          map["result"]["address"]["txs"][0]["status"].toString() ??
      "Пусто";
  if (map["result"]["address"]["txs"][0]["from"] ==
      map["result"]["address"]["address"]) {
    text = text + "\nОтправлено: " + "Владелец кошелька " ?? "Пусто";
    text = text +
        "\nПолучатель: " +
        map["result"]["address"]["txs"][0]["to"].toString();
  } else {
    text = text +
            "\nОтправитель: " +
            map["result"]["address"]["txs"][0]["to"].toString() ??
        "Пусто";
    text = text + "\nПолучено: " + "Владелец кошелька ";
  }
  return text;
}
