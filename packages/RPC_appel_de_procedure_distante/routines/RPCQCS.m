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
;! Nomprog     : RPCQCS                                                       !
;! Module      : RPC (remote procedure call)                                  !
;! But         : Vérifiez si cet utilisateur peut exécuter ce RPC.            !
;!                                                                            !
;! Description :                                                              !
;!                                                                            !
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

XQCS ;
 ;
CHK(XQUSR,XQOPT,XQRPC) ;Vérifiez si cet utilisateur peut exécuter ce RPC depuis
 ; cette option. Appelé par gtmYexpertRPC et RPCUSR.
 ;
 ; Paramètre d'entrée
 ; ==================
 ; XQUSR - DUZ de l'utilisateur
 ; XQOPT - Nom ou IEN de l'option
 ; XQRPC - Nom ou IEN de la procédure à distance. Si cet
 ;         variable est nulle aucun contrôle n'est effectué pour voir si une
 ;         procédure est autorisée. C'est, nous ne regardons
 ;         pour voir si l'option est là et si l'utilisateur
 ;         lui a été attribué un accès.
 ;
 ; Valeur de sortie
 ; ================
 ; XQMES - Retourné comme 1 si l'utilisateur est autorisé à utiliser ce
 ;         (Et RPC est valide si la variable d'entrée XQRPC n'est pas
 ;         Null), ou comme chaîne de message expliquant pourquoi l'option
 ;         Ou RPC n'est pas autorisé.
 ;
 ; Convention
 ; ==========
 ; Si le code M exsists dans la globale ^RPC("YXP",#option,"RPC",#rpc,1) la
 ; règles pour un RPC correspondant, les ensembles de logiciels
 ; Le drapeau XQRPCOK à 1 et exécute le code du champ.
 ; Si le drapeau est renvoyé comme étant inférieur à 1,
 ; l'utilisation de ce RPC est refusée. Les règles sont rédigées par le
 ; paquet développeur et ne sont pas nécessaires.
 ;
 ;
 I '$G(DUZ) S DUZ=$G(XQUSR)
 N %,X,XQCY0,XQDIC,XQKEY,XQRPCOK,XQPM,XQSM,XQSMY,XQYSAV
 ;
 S XQMES=1
 
 Q XQMES ; a supprimer après la création de la gestion des droits **************************

 D OPT I 'XQMES Q XQMES
 I ($G(XQY0)'="RPCUSR VERIFIER CODE")&(XQUSR>0) D USER I 'XQMES Q XQMES
 S %=$G(XQRPC) I %]"" S XQRPC=% D RPC I 'XQMES Q XQMES
 Q XQMES
 ;
 ;
OPT ;Voir si l'option est présente et si elle est de type broker
 I XQOPT'=+XQOPT S XQOPT=$O(^RPC("YXP","id",XQOPT,0))
 I XQOPT'>0 S XQMES="Aucune option de ce type dans la référence croisée ""id"" du fichier d'options." Q
 I $G(MODE)="CHECK" D OPT1 Q
 I '$D(^TMP("XQCS",$J)) S XQOPT=$$OPTLK($P(^RPC("YXP",XQOPT,0),U))
 Q
OPT1 ;
 I XQOPT'=+XQOPT S XQOPT=$O(^RPC("YXP","id",XQOPT,0)) I XQOPT'>0 S XQMES="Aucune option de ce type dans la référence croisée ""id"" du fichier d'options." Q
 I '$D(^RPC("YXP",XQOPT,0)) S XQMES="Aucune option de ce type dans le fichier d'options."  Q
 ;I $P(^RPC("YXP",XQOPT,0),U,4)'="id" S XQMES="Cette option n'est pas une option Client/Serveur."  Q
 ;
 ;Vérifiez s'il n'y a pas de commande, etc.
 ;
 S XQCY0=^RPC("YXP",XQOPT,0) ;W XQCY0
 I $L($P(XQCY0,U,3)) S XQMES="Option hors service avec message : "_$P(XQCY0,U,3)_"."  Q
 I $L($P(XQCY0,U,6)) S %=$P(XQCY0,U,6) I '$D(^XUSEC(%,DUZ)) S XQMES="Option verrouillée, "_$P(^VA(200,DUZ,0),U)_" ne tient pas la clé."  Q
 I $L($P(XQCY0,U,16)) I $D(^RPC("YXP",XQOPT,3)),^(3)]"" S %=^(3) I $D(^XUSEC(%,DUZ)) S XQMES="Verrouillage inverse, "_$P(^VA(200,DUZ,0),U)_" tient la clef."  Q
 I $L($P(XQCY0,U,9)) S XQZ=$P(XQCY0,U,9) D ^XQDATE S (XX,X)=% D XQO^XQ92 I X=""!(XX'=X) S XQMES="Cette option est limitée dans le temps."  Q
 I $D(^RPC("YXP",+XQOPT,3.91)),$P(^(3.91,0),U,4)>1 S:$D(XQY) XQYSAV=XQY D ^XQDATE S X=%,XQY=+XQOPT D ^XQ92 S:$D(XQYSAV) XQY=XQYSAV I X="" S XQMES="Cette option est limitée dans le temps."  Q
 Q
 ;
OPTLK(V) ;Rechercher une option dans le fichier, retourner son IEN
 N XQOPT S XQOPT=$O(^RPC("YXP","id",V,0)) I XQOPT'>0 Q ""
 I '$D(XQMES) N XQMES S XQMES=1
 N XQCS,XQCSO S XQCS(XQOPT)="" N XQOPT K ^TMP("XQCS",$J)
 F  S XQOPT=$O(XQCS("")) Q:XQOPT=""  K XQCS(XQOPT) I '$D(XQCSO(XQOPT)) D OPT1 D:XQMES  I 'XQMES Q
 . N I,J F I=0:0 S I=$O(^RPC("YXP",XQOPT,"RPC",I)) Q:I'>0  K J S J=^(I,0) S:$D(^(1)) J(1)=^(1) I '$D(^TMP("XQCS",$J,+J)) S ^TMP("XQCS",$J,+J,0)=J I $D(J(1)) S ^(1)=J(1)
 . F I=0:0 S I=$O(^RPC("YXP",XQOPT,10,I)) Q:I'>0  S J=+^(I,0) I $P(^RPC("YXP",J,0),U,4)="id" S XQCS(J)=""
 . S XQCSO(XQOPT)=""
 . Q
 Q $O(^RPC("YXP","id",V,0))
 ;
RPC ;Voir si rpc exsists, est enregistré, est verrouillé, etc.
 ; I '$D(^RPC("YXP",XQOPT,"RPC",0)) S XQMES="Pas de sous-fichier RPC défini pour l'option "_$P(^RPC("YXP",XQOPT,0),U)_"." Q
 ; I $P(^RPC("YXP",XQOPT,"RPC",0),U,4)<1 S XQMES="Aucun appel de procédure distante enregistré pour l'option "_$P(^RPC("YXP",XQOPT,0),U)_"." Q
 I XQRPC'=+XQRPC S XQRPC=$O(^RPC("YXP","id",XQRPC,0)) I XQRPC'>0 S XQMES="Aucun RPC par ce nom dans la référence croisée ""id"" du fichier de procédure à distance." Q
 I '$D(^RPC("YXP",XQRPC,0)) S XQMES="Aucune procédure de ce type dans le fichier de procédure à distance." Q
 ; I '$D(^RPC("YXP",XQOPT,"RPC","id",XQRPC)) S XQMES="La procédure à distance "_$P(^RPC("YXP",XQRPC,0),U)_" n'est pas enregistré à l'option "_$P(^RPC("YXP",XQOPT,0),U)_"." Q
 I '$D(^TMP("XQCS",$J,XQRPC)) S XQMES="La procédure à distance "_$P(^RPC("YXP",XQRPC,0),U)_" n'est pas enregistré à l'option "_$P(^RPC("YXP",XQOPT,0),U)_"." Q
 ; S %=$O(^RPC("YXP",XQOPT,"RPC","id",XQRPC,0)),XQKEY=$P(^RPC("YXP",XQOPT,"RPC",%,0),U,2)
 S XQKEY=$P(^TMP("XQCS",$J,XQRPC,0),U,2)
 I $L(XQKEY) I '$D(^XUSEC(XQKEY,XQUSR)) S XQMES="La procédure à distance est verrouillée." Q
 ;
RULES ;Check the rules for this RPC
 ;S %=$O(^RPC("YXP",XQOPT,"RPC","id",XQRPC,0))
 ;I $D(^RPC("YXP",XQOPT,"RPC",%,1)),$L(^(1)) D
 I $D(^TMP("XQCS",$J,XQRPC,1)),$L(^(1)) D
 . S XQRPCOK=1
 . X ^TMP("XQCS",$J,XQRPC,1)
 . I XQRPCOK<1 S XQMES="Test de règles d'échec de demande de procédure distante."
 . Q
 Q
 ;
 ;
 ;
USER ;Vérifiez si XQUSR a été assigné accéder à cette option ou non
 ;
 N XQYES
 S XQMES=1,(XQSMY,%,XQYES)=0
 ;
TOP ;Voir si XQOPT est au niveau supérieur d'un arbre: primaire, secondaire ou commun
 S XQPM=+$G(^VA(200,XQUSR,201)) I XQOPT=XQPM Q
 ;
 ;Check the Common Options (XUCOMMAND)
 I $D(^RPC("YXP","id","XUCOMMAND")) D
 . N XQCOM
 . S XQCOM=$O(^RPC("YXP","id","XUCOMMAND",0))
 . I $D(^RPC("YXP",XQCOM,10,"id",XQOPT)) S XQYES=1
 . I XQYES Q
 . I '$D(^XUTL("XQO","PXU",0)) S %=$$BUILD("PXU")
 . I $D(^XUTL("XQO","PXU","^",XQOPT)) S XQYES=1
 . Q
 I XQYES Q
 ;
 ;
 I $D(^VA(200,XQUSR,203,0)),$P(^(0),U,4)>0 S XQSMY=1 D
 . S XQDIC="U"_XQUSR I $S('$D(^XUTL("XQO",XQDIC,0)):1,'$D(^VA(200,XQUSR,203.1)):1,1:^VA(200,XQUSR,203.1)'=$P(^XUTL("XQO",XQDIC,0),U,2)) D ^XQSET
 . S (XQSM,%)=0
 . F  Q:%  S XQSM=$O(^XUTL("XQO",XQDIC,"^",XQSM)) Q:XQSM=""  I XQSM=XQOPT S XQYES=1 Q
 . Q
 I XQYES Q
 ;
DEEP ;Voir si c'est sous le sommet quelque part - commencer avec l'arbre primaire
 I XQPM>0 D
 .S XQDIC="P"_XQPM
 .S XQYES=$S($D(^XUTL("XQO",XQDIC,"^",XQOPT)):1,$D(^RPC("YXP","AXQ",XQDIC,"^",XQOPT)):1,1:0)
 .Q
 I XQYES Q
 ;
 ;Vérifier les arbres secondaires
 S (XQSM,%)=0
 I XQSMY F  Q:XQYES  S XQSM=$O(^XUTL("XQO","U"_XQUSR,"^",XQSM)) Q:XQSM=""  D
 .S XQDIC="P"_XQSM
 .S XQYES=$S($D(^XUTL("XQO",XQDIC,"^",XQOPT)):1,$D(^RPC("YXP","AXQ",XQDIC,"^",XQOPT)):1,1:0)
 . Q
 I XQYES Q
 ;
 I $L(XQMES<5) S XQMES="User "_$P(^VA(200,XQUSR,0),U)_" does not have access to option "_$P(^RPC("YXP",XQOPT,0),U)
 Q
 ;
 ;Fin du programme principal
 ;
BUILD(XQDIC)   ;Un nœud XUTL manquant nous amène ici
 I $D(^RPC("YXP","AXQ",XQDIC)) D
 .L +^RPC("YXP","AXQ",XQDIC):5
 .I '$D(^XUTL("XQO",XQDIC)) M ^XUTL("XQO",XQDIC)=^RPC("YXP","AXQ",XQDIC)
 .L -^RPC("YXP","AXQ",XQDIC)
 .Q
 I $D(^XUTL("XQO",XQDIC,0)) Q 1
 ;
 ;Si elles ne sont même pas dans le ^RPC, elles les rendent à partir de zéro
 I '$D(^RPC("YXP","AXQ",XQDIC)) D
 .;D REACT^XQ84(DUZ)
 .S XQMES="Vos menus sont en cours de reconstruction. Veuillez réessayer plus tard."
 Q 0






