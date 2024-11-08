import plantas 

class Parcela {
    const property ancho
    const largo
    const property horasDeSol
    const plantas = []

    method superficie() = ancho * largo
    method cantidadMaxPlantas(){
        if (ancho>largo) return self.superficie() / 5
        else return self.superficie()/3 + largo  
    }
    method cantidadDePlantas() = plantas.size()
    method tieneComplicaciones() = plantas.any{p=>p.toleranciaSol()<horasDeSol}
    method plantar(unaPlanta) {
        if (self.cantidadDePlantas()>=self.cantidadMaxPlantas()){
            if (horasDeSol-unaPlanta.toleranciaSol() >= 2){
                self.error("No se puede plantar esta planta")
            }
            else {
                self.error("No se admiten mas plantas")
            }
        }
        else 
            plantas.add(unaPlanta)
    } 
    method tienePlantaMayorA(unaMedida) = plantas.any{p=>p.altura()>unaMedida} 

    method plantaEstaBienAsociada(unaPlanta)

    method cantidadDePlantasBienAsociadas() = plantas.count({p=>self.plantaEstaBienAsociada(p)})

    method porcentajePlantasBienAsociadas() = self.cantidadDePlantasBienAsociadas()/self.cantidadDePlantas()
}

class ParcelaEcologica inherits Parcela {
    override method plantaEstaBienAsociada(unaPlanta) = not self.tieneComplicaciones() && unaPlanta.resultaIdeal(self)
}

class ParcelaIndustrial inherits Parcela {
    override method plantaEstaBienAsociada(unaPlanta) = self.cantidadDePlantas() <= 2 && unaPlanta.esFuerte()
}

object inta {
    const property parcelas = []

    method agregarParcelas(listaParcelas){
        parcelas.addAll(listaParcelas)
    }

    method promedioPlantasPorParcela() = self.totalDePlantas() / self.cantidadParcelas()

    method totalDePlantas() = parcelas.sum({ p => p.cantidadDePlantas() })

    method cantidadParcelas() = parcelas.size()

   method parcelaMasAutosustentable() = self.parcelasConMasDe(4).max({p=>p.porcentajePlantasBienAsociadas()})

   method parcelasConMasDe(unaCantidad) = parcelas.filter({p=>p.cantidadDePlantas()>unaCantidad})
}