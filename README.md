# Alfred_Discord

Bot Discord reprenant le fonctionnement du [bot Messenger de hgueguen](https://github.com/hgueguen/alfred-messenger).

Réalisé avec Ruby 3.0.2, Rails 7.0.3, et la gem DiscordRB par [Amine](https://github.com/scosy) et [Wilfried](https://github.com/wilfriedmuffins)

## Fonctionnement

Lié à un serveur **Discord**, Alfred va vous demander de remplir un formulaire tout au long de la journée.

Ce formulaire est inspiré de [cet article](https://www.hacking-social.com/2018/12/03/f10-evaluer-son-propre-flow/) qui parle de comment évaluer son propre flow, il pourra également vous aider à interpréter les résultats.

<p align="center">
  <img src="https://www.hacking-social.com/wp-content/uploads/2017/09/r%C3%A9sum%C3%A9flow-1.jpg" width="50%" height="50%">
</p>

## Commandes

**!hello** : Permet au bot d'enregistrer l'utilisateur en base de données.

**!start** : Alfred va envoyer un lien vers le formulaire à l'utilisateur toutes les 1-3h si il est enregistré.

**!stop**  : Alfred arrête d'envoyer le formulaire et enregistre les réponses envoyées. Ne fonctionne que si la commande **!start** a été lancée.

**!link** &nbsp;: Alfred enverra un lien à l'utilisateur pour qu'il puisse consulter ses résultats. Il devra au préalable avoir envoyé 10 réponses sur 2j minimum.
