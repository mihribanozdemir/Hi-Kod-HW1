
int carp(int a, int b){
  int multiplyByTwo(int x) {
    x=x*2;
    return x;
  }
    int result = a;
  for (int i = 1; i < b; i++) {
    result = multiplyByTwo(result);
  }
  return result;
}
class kedi {
  int yasi;
  String adi;
  bool tekirMi;
  String sahibi;
  bool disiMi;

  kedi(this.yasi,this.adi,this.tekirMi,this.sahibi,this.disiMi);


}
void main() {
  print(carp(5,3));

  List<String> liste1 = ["a", "b", "c"];
  print("Liste1 elemanları:, $liste1");
  liste1.remove("a");
  print("Liste1 sonra: $liste1");


}
