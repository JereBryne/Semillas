class Planta {
  const property anioDeObtencion 
  const property altura

  method esFuerte() = self.toleranciaSol() > 10
  method daSemillas() = self.esFuerte()
  method toleranciaSol()
}

class Menta inherits Planta {
  override method toleranciaSol() = 6

  override method daSemillas() = super() or altura > 0.4

  method espacioQueOcupa() = altura*3

  method resultaIdeal(unaParcela) = unaParcela.superficie() > 6
}

class HierbaBuena inherits Menta {
  override method espacioQueOcupa() = super()*2
}

class Soja inherits Planta {
  override method toleranciaSol() {
      if (altura < 0.5) return 6
      else if (altura.between(0.5, 1)) return 7
      else return 9
  } 
  override method daSemillas() = 
    (super() or anioDeObtencion) and anioDeObtencion > 2007

  method espacioQueOcupa() = altura/2
  
  method resultaIdeal(unaParcela) = unaParcela.horasDeSol() == self.toleranciaSol() 
}

class SojaTransgenica inherits Soja {
  override method daSemillas() = false

  override method resultaIdeal(unaParcela) = unaParcela.cantidadMaxPlantas() == 1
}

class Quinoa inherits Planta {
  const property toleranciaSol 

  override method daSemillas() = super() or anioDeObtencion < 2005

  method espacioQueOcupa() = 0.5

  method resultaIdeal(unaParcela) = not unaParcela.tienePlantaMayorA(1.5)
}
