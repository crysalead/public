# Notice d'Installation de Windows 11

## Étapes d'Installation

### 1. Préparation

1. **Sauvegardez vos données** : Avant de commencer l'installation, assurez-vous de sauvegarder toutes vos données importantes sur un disque dur externe ou un service de stockage en nuage.
2. **Si vous n'avez pas de support d'installation : Rendez-vous sur le site officiel de [Ubuntu et télécharger l'image de la dernière version stable LTS](https://ubuntu.com/download/desktop) ou de [Kubuntu et télécharger l'image de la dernière version stable LTS](https://kubuntu.org/getkubuntu/).
3. **Créez un support d'installation** : Télécharger [balenaEtcher](https://etcher.balena.io/) pour pouvoir créer une clé USB bootable à partir de l'image ISO téléchargée précédement.

### 2. Installation de Ubunutu/Kunbuntu

1. **Démarrez à partir du support d'installation** :
   - Insérez la clé USB d'installation dans votre ordinateur.
   - Redémarrez votre ordinateur et accédez au menu de démarrage (généralement en appuyant sur une touche comme F2, F12, ESC ou DEL pendant le démarrage).
   - Sélectionnez le support USB comme périphérique de démarrage (si plusieurs choix sont disponibles séléctionner celui disposant de la précision UEFI).

2. **Suivez les instructions de la vidéo** :
   - Lors de l'étape de nommage de votre ordinateur, utilisez la convention suivante:
      - Ordinateurs de Bureau sous Linux: LD-XXX (L pour linux, D pour desktop, XXX le numéro de votre machine)
      - Ordinateurs Portables sous Linux : LL-XXX (L pour linux, L pour laptop, XXX le numéro de votre machine)
   - Ne pas omètre les zéros, ex: LD-005 et non LD-5
   - Le nom de la machine doit être en majuscule, ex: LD-005 et non ld-005
   - Le numéro de votre machine est à demander au responsable en question.

### 3. Étape post-installation

Lancer les commandes suivantes dans un terminal

```bash
sudo apt-get update
sudo apt-get install curl gpg unattended-upgrades update-notifier-common
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /usr/share/keyrings/
rm microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/ubuntu/$(lsb_release -rs)/prod $(lsb_release -cs) main" >> /etc/apt/sources.list.d/microsoft-ubuntu-$(lsb_release -cs)-prod.list'
sudo apt-get update
sudo apt install intune-portal
sudo apt-get upgrade
```

Ensuite il faut éditer le fichier /etc/apt/apt.conf.d/50unattended-upgrades afin d'autoriser les mises à jour automatiques, la suppression des anciens paquets et le redémarrage automatique :

```bash
sudo nano /etc/apt/apt.conf.d/50unattended-upgrades
```

Modifier le fichier comme suit :
```bash
Unattended-Upgrade::Allowed-Origins {
":";
"*:*";
};
Unattended-Upgrade::Automatic-Reboot "true";
Unattended-Upgrade::Remove-Unused-Dependencies "true";
```

La dernière étape consiste à redémarrer l'ordinateur puis lancer intune dans un terminal pour se connecter avec ses identifiants professionels :

```
intune-portal
```

En cas d'erreur au moment de la connexion, redémarrer l'ordinateur / attendre 30 min.
