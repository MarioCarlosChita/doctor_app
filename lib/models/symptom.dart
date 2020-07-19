
class Symptom
{

  int pk_sintomas;
  String descricao;
  String status;
  String data_criacao;

  Symptom({this.pk_sintomas, this.descricao, this.data_criacao, this.status});

  Symptom.fromJson(Map<String, dynamic> json){
    pk_sintomas =json['pk_sintomas'];
    descricao =json['descricao'];
    status =json['status'];
    data_criacao =json['data_criacao'];
  }
}