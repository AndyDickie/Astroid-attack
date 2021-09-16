
void refreshList() {
  table = loadTable("test.csv", "header");
  list1.clear();
  for (int i = 0; i < table.getRowCount(); i++) {
    Question q = new Question(table.getInt(i, id), table.getString(i, string), table.getString(i, ans));
    list1.add(q);
  }
}

void stilSpg() {
  if (list1.size() > 0) {
    int randomtal = int(random(list1.size()));
    Question s = list1.get(randomtal);
    s.printspg();
    list1.remove(randomtal);
  }
}
