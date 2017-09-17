class Jogador extends Entidade{
//Atributos
  boolean[] wasd = {false, false, false, false};
  float velocidadeX, velocidadeY, velocidadeMax, velocidadeMin, aceleracao, desaceleracao;
  
  
//Construtor
  public Jogador(){
    this.aceleracao = 0.4;
    this.desaceleracao = 0.2;
    this.velocidadeX = 0;
    this.velocidadeY = 0;
    this.velocidadeMax = 3;
    this.velocidadeMin = 0.2;
  }
  
//Metodos
  void movimentar(){
    //Eixo X Checar
    if(this.wasd[1] == true){
      this.moverEsquerda();
    }
    else if(this.wasd[3] == true){
      this.moverDireita();
    }
    //Eixo Y Checar
    if(this.wasd[0] == true){
      this.moverCima();
    }
    else if(this.wasd[2] == true){
      this.moverBaixo();
    }
    
    this.desaceleracaoX();
    this.desaceleracaoY();
    this.checarPosicao();
  }

  //Eixo X Mover
  void moverEsquerda(){
    if(this.x > 0){
      if(this.velocidadeX > -this.velocidadeMax){
        this.velocidadeX -= this.aceleracao;
        if(this.velocidadeX > 0){
          this.velocidadeX -= this.aceleracao;
        }
      }
      this.x += this.velocidadeX;
    }
  }
  
  void moverDireita(){
    if(this.x < width-this.largura){
      if(this.velocidadeX < this.velocidadeMax){
        this.velocidadeX += this.aceleracao;
        if(this.velocidadeX < 0){
          this.velocidadeX += this.aceleracao;
        }
      }
      this.x += this.velocidadeX;
    }
  }
  
  //Eixo Y Mover
  void moverCima(){
    if(this.y > 0){
      if(this.velocidadeY > -this.velocidadeMax){
        this.velocidadeY -= this.aceleracao;
        if(this.velocidadeY > 0){
          this.velocidadeY -= this.aceleracao;
        }
      }
      this.y += this.velocidadeY;
    }
  }
  
  void moverBaixo(){
    if(this.y < height-this.altura){
      if(this.velocidadeY < this.velocidadeMax){
        this.velocidadeY += this.aceleracao;
        if(this.velocidadeY < 0){
          this.velocidadeY += this.aceleracao;
        }
      }
      this.y += this.velocidadeY;
    }
  }
  
  //Desaceleracao Eixo X
  void desaceleracaoX(){
    if(this.x > 0 && this.x < width-this.largura){
      if(this.wasd[1] == false && this.wasd[3] == false){
        if(this.velocidadeX < -this.velocidadeMin || this.velocidadeX > this.velocidadeMin){
          if(this.velocidadeX > 0){
            this.velocidadeX -= this.desaceleracao; 
          }
          else if(this.velocidadeX < 0){
            this.velocidadeX += this.desaceleracao; 
          }
          this.x += this.velocidadeX;
        }
        else{
          this.velocidadeX = 0;
        }
      }
    }
    else{
      this.velocidadeX = 0;
    }
  }
  
  //Desaceleracao Eixo Y
  void desaceleracaoY(){
    if(this.y > 0 && this.y < height-this.altura){
      if(this.wasd[0] == false && this.wasd[2] == false){
        if(this.velocidadeY < -this.velocidadeMin || this.velocidadeY > this.velocidadeMin){
          if(this.velocidadeY > 0){
            this.velocidadeY -= this.desaceleracao; 
          }
          else if(this.velocidadeY < 0){
            this.velocidadeY += this.desaceleracao; 
          }
          this.y += this.velocidadeY;
        }
        else{
          this.velocidadeY = 0;
        }
      }
    }
    else{
      this.velocidadeY = 0;
    }
  }
  
  //Ativadores de Direcao
  //Eixo X Ativador
  void esquerda(boolean pressionando){
    this.wasd[1] = pressionando;
  }
  
  void direita(boolean pressionando){
    this.wasd[3] = pressionando;
  }
  
  //Eixo Y Ativador
  void cima(boolean pressionando){
    this.wasd[0] = pressionando;
  }
  
  void baixo(boolean pressionando){
    this.wasd[2] = pressionando;
  }
  
  void checarPosicao(){
    //Eixo X
    if(this.x < 0){
      this.x += 1;
    }
    else if(this.x > width-this.largura){
      this.x -= 1;
    }
    
    //Eixo Y
    if(this.y < 0){
      this.y += 1;
    }
    else if(this.y > height-this.altura){
      this.y -= 1;
    }
  }


}