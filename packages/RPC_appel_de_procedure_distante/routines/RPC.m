;!----------------------------------------------------------------------------!
;!                                                                            !
;! Licence et conditions d'use                                        !
;! Yexpert : (your) Systeme Expert sous Mumps GT.M et GNU/Linux               !
;! Copyright (C) 2001-2015 by Hamid LOUAKED (HL).                             !
;!                                                                            !
;! Hamid LOUAKED                                                              !
;! 10, impasse Faraday                                                        !
;! 78520 LIMAY                                                                !
;! France                                                                     !
;!                                                                            !
;! yexpert@yrelay.fr                                                          !
;! http://www.yrelay.fr/                                                      !
;!                                                                            !
;! Ce programme est un logiciel libre ; vous pouvez le redistribuer           !
;! et/ou le modifier conformement aux dispositions de la Licence Publique     !
;! Generale GNU, telle que publiee par la Free Software Foundation ;          !
;! version 3 de la licence, ou encore (a votre choix) toute version ulterieure.
;!                                                                            !
;! Ce programme est distribue dans l'espoir qu'il sera utile,                 !
;! mais SANS AUCUNE GARANTIE ; sans meme la garantie implicite de             !
;! COMMERCIALISATION ou D'ADAPTATION A UN OBJET PARTICULIER.                  !
;! Pour plus de details, voir la Licence Publique Generale GNU.               !
;!                                                                            !
;! Un exemplaire de la Licence Publique Generale GNU doit etre fourni avec    !
;! ce programme ; si ce n'est pas le cas,                                     !
;! ecrivez a la Free Software Foundation Inc.,                                !
;! 675 Mass Ave, Cambridge, MA 02139, Etats-Unis.                             !
;!                                                                            !
;! Ce logiciel est telechargeable a l'adresse http://www.yrelay.fr/ ;         !
;! vous trouverez egalement, sur ce site, un mode d'emploi complet            !
;! et des informations supplementaires.                                       !
;!                                                                            !
;!----------------------------------------------------------------------------!
;!                                                                            !
;! GNU General Public License : http://www.gnu.org/copyleft/gpl.html          !
;!                                                                            !
;! Traduction francaise : http://dachary.org/loic/gpl-french.pdf              !
;!                                                                            !
;!----------------------------------------------------------------------------!

;!============================================================================!
;! Nomprog     : RPC                                                          !
;! Module      : Fonction permettant l'accès aux RPCs de Yexpert...           !
;! But         :                                                              !
;!                                                                            !
;! Description :                                                              !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!----------------------------------------------------------------------------!
;! Modif ! Auteur ! Date     ! Commentaires                                   !
;!-------!--------!----------!------------------------------------------------!
;!       ! HL     ! 22/03/01 ! Creation                                       !
;! HL001 ! HL     ! 00/00/00 ! Description succincte de la modification.      !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

RPC ;
 QUIT
 ;

CKRPC(RESULT,RPCNAME,RPCUSE,VERNUM)
 ;Point d'entrée pour les RPCs de la forme "RPC DISPONIBLE".
 ;RPCUSE("LOCALE" or "Distante") et VERNUM sont optionnels.
 ;Vérifie si RPC existe et si l'option INACTIVE est définie pour une use spécifiée.
 ;Vérifie également le numéro de version s'il est transmis.
 ;Result = 1 Pour peut être exécuté ; 0 Pour ne peut pas être exécuté.
 N RPCIEN
 S RESULT=0
 S RPCIEN=$$RPCIEN($G(RPCNAME))
 I RPCIEN,$$RPCAVAIL(RPCIEN,$G(RPCUSE),$G(VERNUM)) S RESULT=1
 Q

RPCIEN(RPCNAME)
 ;Fonction qui renvoie IEN de RPC en fonction du nom.
 ;Retour 0 si RPC n'existe pas.
 I RPCNAME="" Q 0
 Q +$O(^RPC("YXP","id",RPCNAME,0))
 ;

RPCAVAIL(RPCIEN,RPCUSE,VERNUM)
 ;Fonction, identifie si RPC est actif (Production/Inactif) et la version correcte.
 ;RPCUSE (facultatif) = Locale vérifier l'use locale ; Distante vérifier l'use à distance.
 ;VERNUM (facultatif) vérifié uniquement pour les RPC distants.
 N RPC0,INACT
 S RPC0=$G(^RPC("YXP",+RPCIEN,"statut"))
 Q:RPC0="" 0
 S INACT=RPC0
 I INACT'="Production" Q 0 ;RPC marqué inactif.
 S RPCUSE=$G(RPCUSE)
 I RPCUSE="" Q 1 ;Vérification locale et distante pas nécessaire.
 I RPCUSE="LOCALE",INACT=2 Q 0 ;use locale, RPC est uniquement distante.
 I RPCUSE="Distante",INACT=3 Q 0 ;use distante, RPC est uniquement locale.
 I RPCUSE="Distante",+$G(VERNUM),'$$CKVERNUM(VERNUM,RPC0) Q 0 ;Échec de la version # check.
 Q 1 ;Doit être ok
 

CKVERNUM(VERNUM,RPCVER,RPCIEN)
 ;Fonction booléenne. Renvoie 1 si la version RPC est > ou = au numéro de version à vérifier.
 ;VERNUM = Numéro de version transmis (c'est-à-dire à partir du client) à vérifier.
 ;RPCVER = Numéro de version dans le fichier de procédure distante. (facultatif).
 ;RPCIEN le RPC étant vérifié. Cela est nécessaire si RPCVER n'est pas envoyé.
 I +$G(RPCIEN),'+$G(RPCVER) S RPCVER=$G(^RPC("YXP",RPCIEN,"statut"))
 I +RPCVER<+VERNUM Q 0
 Q 1
 ;

INIT
 ;Pour tester :
 ;view "LINK":"RECURSIVE" zl "RPC" d INIT^RPC w !!! zwr ^RPC
 ;Pour extraire la globale ^RPC
 ;ssh -p 22 yrelay@localhost
 ;source /home/yrelay/config/env
 ;/home/yrelay/libraries/gtm/mupip EXTRACT -SELECT=RPC /home/yrelay/tmp/RPC.zwr

 K ^RPC

 S ^RPC("YXP","NETNAME")="CODE.YRELAY.FR"

 S ^RPC("YXP",1,0)="RPCUSR ETABLIR CONNEXION^SETUP^RPCUSR^2^R"
 S ^RPC("YXP",1,"nom")="RPCUSR ETABLIR CONNEXION"
 S ^RPC("YXP",1,"version")="1.0.0"
 S ^RPC("YXP",1,"use")="LOCALE"
 S ^RPC("YXP",1,"context")="RPCUSR ETABLIR CONNEXION"
 S ^RPC("YXP",1,"division")="Tester le RPC"
 S ^RPC("YXP",1,"description")="Etablit l'environnement nécessaire pour l'authentification."
 S ^RPC("YXP",1,"statut")="Production"
 S ^RPC("YXP","id","RPCUSR ETABLIR CONNEXION",1)=""

 S ^RPC("YXP",2,0)="RPCUSR VERIFIER CODE^VALIDAV^RPCUSR^2^R"
 S ^RPC("YXP",2,"nom")="RPCUSR VERIFIER CODE"
 S ^RPC("YXP",2,"version")="1.0.0"
 S ^RPC("YXP",2,"use")="LOCALE"
 S ^RPC("YXP",2,"context")="RPCUSR VERIFIER CODE"
 S ^RPC("YXP",2,"division")="Tester le RPC"
 S ^RPC("YXP",2,"description")="Cette API vérifie si une paire de codes ACCESS/VERIFY est valide."
 S ^RPC("YXP",2,"description",1)="Il retourne un tableau de valeurs"
 S ^RPC("YXP",2,"description",2)=" "
 S ^RPC("YXP",2,"description",3)="R(0)=DUZ si la connexion était correcte, zéro si non OK."
 S ^RPC("YXP",2,"description",4)="R(1)=(0 = OK, 1,2 ... = Impossible de se connecter pour une raison quelconque)."
 S ^RPC("YXP",2,"description",5)="R(2)= vérifier que les besoins changent."
 S ^RPC("YXP",2,"description",6)="R(3)=Message."
 S ^RPC("YXP",2,"description",7)="R(4)=0"
 S ^RPC("YXP",2,"description",8)="R(5)=compte du nombre de lignes de texte, zéro si aucun."
 S ^RPC("YXP",2,"description",9)="R(5+n)=texte du message."
 S ^RPC("YXP",2,"statut")="Production"
 S ^RPC("YXP","id","RPCUSR VERIFIER CODE",2)=""

 S ^RPC("YXP",3,0)="RPCBAS AFFICHER BONJOUR^AFF^RPCBAS^1^5^6^7^R"
 S ^RPC("YXP",3,"nom")="RPCBAS AFFICHER BONJOUR"
 S ^RPC("YXP",3,"version")="1.0.0"
 S ^RPC("YXP",3,"use")="LOCALE"
 S ^RPC("YXP",3,"context")="RPCBAS"
 S ^RPC("YXP",3,"division")="Tester le RPC"
 S ^RPC("YXP",3,"description")="Depuis un terminal faire ssh yrelayprog@localhost puis w $$test^gtmYexpertRPC()"
 S ^RPC("YXP",3,"statut")="Production"
 S ^RPC("YXP","id","RPCBAS AFFICHER BONJOUR",3)=""

 S ^RPC("YXP",10,0)="RPCBDD EXECUTER COMMANDE SET^SET^RPCBDDC^1^5^6^7^R"
 S ^RPC("YXP",10,"nom")="RPCBDD EXECUTER COMMANDE SET"
 S ^RPC("YXP",10,"version")="1.0.0"
 S ^RPC("YXP",10,"use")="LOCALE"
 S ^RPC("YXP",10,"context")="RPCBDD"
 S ^RPC("YXP",10,"division")="Executer la commande"
 S ^RPC("YXP",10,"description")="SET affecte une valeur à l'attribut d'un individu."
 S ^RPC("YXP",10,"statut")="Production"
 S ^RPC("YXP","id","RPCBDD EXECUTER COMMANDE SET",10)=""

 S ^RPC("YXP",11,0)="RPCBDD EXECUTER COMMANDE KILL^KILL^RPCBDDC^1^5^6^7^R"
 S ^RPC("YXP",11,"nom")="RPCBDD EXECUTER COMMANDE KILL"
 S ^RPC("YXP",11,"version")="1.0.0"
 S ^RPC("YXP",11,"use")="LOCALE"
 S ^RPC("YXP",11,"context")="RPCBDD"
 S ^RPC("YXP",11,"division")="Executer la commande"
 S ^RPC("YXP",11,"description")="KILL supprime une valeur d'un attribut d'un individu."
 S ^RPC("YXP",11,"statut")="Production"
 S ^RPC("YXP","id","RPCBDD EXECUTER COMMANDE KILL",11)=""

 S ^RPC("YXP",12,0)="RPCBDD EXECUTER COMMANDE READ^READ^RPCBDDC^1^5^6^7^R"
 S ^RPC("YXP",12,"nom")="RPCBDD EXECUTER COMMANDE READ"
 S ^RPC("YXP",12,"version")="1.0.0"
 S ^RPC("YXP",12,"use")="LOCALE"
 S ^RPC("YXP",12,"context")="RPCBDD"
 S ^RPC("YXP",12,"division")="Executer la commande"
 S ^RPC("YXP",12,"description")="READ lit une valeur d'un attribut d'un individu."
 S ^RPC("YXP",12,"statut")="Production"
 S ^RPC("YXP","id","RPCBDD EXECUTER COMMANDE READ",12)=""

 S ^RPC("YXP",100,0)="RPCUSR SE CONNECTER^^^1^5^6^7^R"
 S ^RPC("YXP","id","RPCUSR SE CONNECTER",100)=""

 Q










