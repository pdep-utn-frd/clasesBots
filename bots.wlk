// 1. Benito, el bot botón, que si un tweet contiene una palabra de su lista negra de palabras, le avisa a la policía, quien registra el usuario y el texto que se twitteó para luego investigar.
// 2. Bots de publicidad: cada uno responde al usuario que originó el tweet con un link publicitario si el tweet contiene una palabra puntual. El mensaje y el link pueden cambiar, pero depende de cada bot. Lo que sí, obligatoriamente deben arrobar al usuario para que a él le lleguen notificaciones, así que a su respuesta se agrega una palabra que es @ concatenado con el nombre de usuario.
// 3. Bots que juntan datos. No responden, pero se guardan información de todos los que twittean.

class CasoReportado {
  var property persona 
  var property texto
}

object policia {
  const registroDeCasos  = []
  method registroDeCasos() = registroDeCasos
  method agregarPersona(unaPersona) {
    const caso = new CasoReportado(persona=unaPersona, texto=unaPersona.tweet())
    registroDeCasos.add(caso)
  }

}
object benito {
  const listaNegra = ["autos"]
  method responderTweetDePersona(unaPersona) {
    if (self.deboResponderAlTweet(unaPersona.tweet())) {
      policia.agregarPersona(unaPersona)
    }
  }

  // analiza si se debe responder al tweet
  method deboResponderAlTweet(unTweet) {
    // debo fijarme si al menos 1 de las palabras de la lista negra
    // esta en el tweet. 

    return unTweet.any(  {  p => listaNegra.contains(p)  }  )
  }
}

object chano {
  method tweet() = ["me", "gustan", "los", "autos"]
}

object pdpTwitter {
  var property bots = [benito, new BotDePublicidad()]

  method tweetear(usuario) {
    bots.forEach({ bot =>
      bot.responderTweetDePersona(usuario)
    })
  } 
}

class BotDePublicidad {
  method responderTweetDePersona(unaPersona) {
    // reemplazar esta implementacion por la correcta
    2/0
  } 
}