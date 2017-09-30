;!----------------------------------------------------------------------------!
;!                                                                            !
;! Licence et conditions d'utilisation                                        !
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
;! Nomprog     : RPCUSR                                                       !
;! Module      : RPC (remote procedure call)                                  !
;! But         : Demande RPC                                                  !
;!                                                                            !
;! Description :                                                              !
;!                                                                            !
;!      Appel RPC, le premier paramètre est toujours call-by-reference        !
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

RPCUSR ;
 QUIT
 ;
HOME	;Point d'entrée pour établir des variables E/S.
 D CLEAN
 S ^TMP($J,"input",1,"value")="Connexion établie"
 Q
 ;
CLEAN	;Nettoyage environnement.
 K ^TMP($J)
 Q
 ;
RESETVAR ;Réinitialiser les variables E/S d'origine.
 Q
 ;Appels RPC, le premier paramètre est toujours appelé par référence
VALIDAV(RET,AVCODE)	;Vérifier l'accès des utilisateurs
 ;Retour R(0)=DUZ, R(1)=(0=OK,1,2 ... = Impossible de se connecter pour une raison quelconque)
 ;R(2)=vérifier que les besoins changent VC, R(3)=Message, R(4)=0, R(5)=nombre msg, R(5+n)
 ;R(R(5)+6)=# utilisateur div doit sélectionner, R(R(5)+6+n)=div

 S RET(0)=0                 ;duz
 S RET(1)=0                 ;OK
 S RET(2)=0                 ;vérifier code valide (VC) - 0 pour VC n'expire jamais
 S RET(3)=""                ;message d'erreur
 S RET(4)=0
 S RET(5)=5
 S RET(6)="RET(6)"
 S RET(7)="Bienvenue chez Irelay"      ;greeting / salutation
 S RET(8)="Votre derniere connection est aujourd'hui a 12:39"
 S RET(9)="Vous avez 311 nouveaux messages. (311 dans le panier 'IN')"
 S RET(10)=""
 S RET(11)="Entrez '^NML' pour lire vos nouveaux messages."
 S RET(12)="Vous avez un courrier PRIORITAIRE!"

 Q
 ;

VCVALID()	;Renvoie 1 si le code de vérification doit être modifié.
 Q:'$G(DUZ) 1
 Q:$P($G(^VA(200,DUZ,.1)),U,2)="" 1 ;VC est vide
 Q:$P(^VA(200,DUZ,0),U,8)=1 0 ;VC n'expire jamais
 N XUSER D USER^XUS(DUZ)
 Q $$VCHG^XUS1

SETUP(RET,RPCUSRNM,CONSKIP,D)	;Crée un environnement pour l'interface graphique

 ;RPCUSRNM code d'activation (ac)
 ;CONSKIP 0=ignorer l'écran de connexion 1=afficher l'écran de connection
 ;D 
 ;0=nom du serveur, 1=volume, 2 =uci, 3=appareil, 4 =#tentatives, 5=ignorer l'écran de connexion, 6=Nom de domaine, 7=Production (0=non, 1=oui)

 S RPCUSRNM=$G(RPCUSRNM),CONSKIP=$G(CONSKIP)

 S RET(0)=$$GETSRV^RPCUSR()
 S RET(1)=""
 S RET(2)=""
 S RET(3)=$I
 S RET(4)=0
 S RET(5)=0
 S RET(6)=$G(^RPC("YXP","NETNAME"))
 S RET(7)=0

 Q

KCHK(%,IEN)	;Vérification des clés
 S IEN=1
 S:$G(IEN)'>0 IEN=$G(DUZ) Q $S($G(IEN)>0:$D(^RPCUSR(%,IEN)),1:0)
 ;




GETSRV()
 ;Pour tester 
 ;view "LINK":"RECURSIVE" zl "RPCSYS" S test=$$GETSRV^RPCUSR() w test
 ;
 N YXPDIST,SRV,FIC,RES
 Q:'$$YXPDIST^%GTM() 0 ;Tester la presence du repertoire de la distribution Yexpert
 S FIC=YXPDIST_"/tmp/RPCSYS_"_$J_".tmp"
 I $L($ZSEARCH(FIC)_$ZSEARCH(FIC)) ZSY "rm "_FIC
 ZSY "hostname >"_FIC
 Q $$FREAD()

FREAD()
 O FIC:(readonly:exception="g BADOPEN")
 U FIC:exception="G EOF"
 F  U FIC R LIG S RES=LIG
EOF I '$ZEOF ZM +$ZS
 C FIC
 ZSY "rm "_FIC
 Q RES
BADOPEN I $P($ZS,",",1)=2 D  Q 0
 . S ERR="Le fichier "_FIC_" n'existe pas."
 I $P($ZS,",",1)=13 D  Q 0
 . S ERR="Le fichier "_FIC_" n'est pas accessible."
 ZM +$ZS
 Q 0
 
INIT
 ;Pour tester 
 ;view "LINK":"RECURSIVE" zl "RPCUSR" d INIT^RPCUSR zwr ^RPCUSR
 ; Pour extraire la globale ^RPCUSR
 ;/home/yrelay/libraries/gtm/mupip EXTRACT -SELECT=RPCUSR /home/yrelay/tmp/RPCUSR.zwr

 ;Retour R(0)=DUZ, R(1)=(0=OK,1,2 ... = Impossible de se connecter pour une raison quelconque)
 ;R(2)=vérifier que les besoins changent VC, R(3)=Message, R(4)=0, R(5)=nombre msg, R(5+n)
 ;R(R(5)+6)=#utilisateur div doit sélectionner, R(R(5)+6+n)=div

 K ^RPCUSR
 S ^RPCUSR(1,0)=0                 ;duz
 S ^RPCUSR(1,1)=0                 ;0 connection OK
 S ^RPCUSR(1,2)=0                 ;vérifier code valide (VC) - 0 pour VC n'expire jamais
 S ^RPCUSR(1,3)=""                ;message d'erreur
 S ^RPCUSR(1,4)=0
 S ^RPCUSR(1,5)=5                 ;nombre msg
 S ^RPCUSR(1,6)="RET(6)"
 S ^RPCUSR(1,7)="Bienvenue chez Irelay"      ;greeting / salutation
 S ^RPCUSR(1,8)="Votre derniere connection est aujourd'hui a 12:39"
 S ^RPCUSR(1,9)="Vous avez 311 nouveaux messages. (311 dans le panier 'IN')"
 S ^RPCUSR(1,10)=""
 S ^RPCUSR(1,11)="Entrez '^NML' pour lire vos nouveaux messages."
 S ^RPCUSR(1,12)="Vous avez un courrier PRIORITAIRE!"
 S ^RPCUSR(1,"group")="PROGRAMMEUR"
 S ^RPCUSR(1,"vc")="0{2s65R!"
 S ^RPCUSR("id","irelay",1)=""
 Q










