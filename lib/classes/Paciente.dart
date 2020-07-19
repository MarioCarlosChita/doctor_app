class Paciente {

    String id  ;
    String nomecompleto;
    String email;
    String senha;
    String data_nascimento ;
    String grupo_sanguineo;
    String altura;
    String peso;
    String genero ;
    String tipo_Usuario;
    String photo;

    Paciente({
      this.nomecompleto ,
      this.email ,
      this.photo,
      this.senha,
      this.genero,
      this.data_nascimento,
      this.grupo_sanguineo,
      this.altura ,
      this.peso ,
      this.tipo_Usuario,
    });


    factory Paciente.jsonFormato(Map<String, dynamic> maps){
        return  Paciente(
          nomecompleto: maps['nomecompleto'],
          email: maps['email'],
          genero: maps['genero'],
          altura: maps['altura'],
          data_nascimento: maps['data_nascimento'],
          grupo_sanguineo: maps['grupo_sanguineo'] ,
          peso: maps['peso'],
          senha: maps['senha'],
          tipo_Usuario: maps['tipo_Usuario'] ,
          photo: maps['photo']
        );
    }


    Map<String , dynamic> toMapPaciente(){
        return {
           "nomecompleto":this.nomecompleto ,
           "email":this.email,
           "altura":this.altura,
           "genero":this.genero,
           "data_nascimento":this.data_nascimento ,
           "grupo_sanguineo":this.grupo_sanguineo ,
           "peso":this.peso ,
           "senha":this.senha ,
           "tipo_Usuario":this.tipo_Usuario
        };
    }



}