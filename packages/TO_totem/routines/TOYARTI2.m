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
;! Nomprog     :                                                              !
;! Module      :                                                              !
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

;TOYARTI2^INT^1^59547,74877^0
TOYARTI2(A) 
 N CH,HE,N,%N,NBL,NP,P,%P,%PORT,PR,Q,%Q,R,%R,UN S $ZT="CTRLC"
 D POCLEPA^%VVIDEO W $$^%QZCHW("Edition en cours ...")
 S %PORT=^TABIDENT(WHOIS,"PRINTER")
 I %PORT'=0 C %PORT O %PORT
 U %PORT S NP=1
 S NBL=^TABIDENT(WHOIS,"IMPRCOUR")
 D EXPL
 D COMP
 D IMPL
 D PHAS
 D TEMP^TOYARTI3
 D ATEM^TOYARTI3
 D TPCP^TOYARTI3
 D CONS^TOYARTI3
 D DIMO^TOYARTI3
 D MATI^TOYARTI4
 D SELT^TOYARTI4
 D SELN^TOYARTI4
END I %PORT'=0 U %PORT W # C %PORT
 Q
COMP Q:$N(^[QUI]NOMENC(A,-1))=-1
 D TETE
 W !,"***************************"
 W !,$$^%QZCHW("*      Composants         *")
 W !,"***************************",! S NL=NL+4
 S N=-1 F %N=0:0 S N=$N(^[QUI]NOMENC(A,N)) Q:N=-1  D AFFCO
 Q
AFFCO D:NL>(NBL-3) TETE W !,N S NL=NL+1
 Q
EXPL Q:$O(^[QUI]EXPLICI(A,""))=""
 D TETE
 W !,"***************************"
 W !,$$^%QZCHW("*  Parametres explicites  *")
 W !,"***************************",! S NL=NL+4
 W !,!,$$^%QZCHW("Nom"),?50,$$^%QZCHW(" Unite"),?65,$$^%QZCHW(" Provenance"),?80,$$^%QZCHW(" Heredite"),! S NL=NL+3
 S N="" F %N=0:0 S N=$O(^[QUI]EXPLICI(A,N)) Q:N=""  S P="" F %P=0:0 S P=$O(^[QUI]EXPLICI(A,N,P)) Q:P=""  S CH=^[QUI]EXPLICI(A,N,P),UN=$P(CH,"^",1),PR=$P(CH,"^",2),HE=$P(CH,"^",3) D AFFE
 Q
AFFE S NL=NL+1 W !,P,?50," ",UN,?65," ",PR,?80," ",HE Q
PHAS Q:$N(^[QUI]FLPHAS(A,-1))=-1  D TETE
 W !,"***************************"
 W !,$$^%QZCHW("*         Phases          *")
 W !,"***************************",! S NL=NL+4
 S N=-1 F %N=0:0 S N=$N(^[QUI]FLPHAS(A,N)) Q:N=-1  S P=-1 F %P=0:0 S P=$N(^[QUI]FLPHAS(A,N,P)) Q:P=-1  S Q=-1 F %Q=0:0 S Q=$N(^[QUI]FLPHAS(A,N,P,Q)) Q:Q=-1  D AFFC
 Q
AFFC D:NL>(NBL-7) TETE S CH=^[QUI]FLPHAS(A,N,P,Q)
 W !,!,$$^%QZCHW("Phase : "),N,?30,$$^%QZCHW(" No d'ordre : "),P,?60,$$^%QZCHW(" Operation : "),Q S NL=NL+2
 F I=1:1:4 I $P(CH,"^",((I-1)*4)+1)'="" W ! W:I=1 $$^%QZCHW("  Condition : ") W ?20,$P(CH,"^",((I-1)*4)+1),?30," ",$P(CH,"^",((I-1)*4)+2),?40," ",$P(CH,"^",((I-1)*4)+3) W:(I'=4)&($P(CH,"^",(I*4)+1)'="") ?50," ",$P(CH,"^",((I-1)*4)+4) S NL=NL+1
 W !,$$^%QZCHW("  Machines possibles : ") S NL=NL+1
 F I=1:1:8 Q:$P(CH,"^",16+I)=""  W !,"    ",$P(CH,"^",16+I) S NL=NL+1
 W !,$$^%QZCHW("  Ou phase de : "),$P(CH,"^",25) S NL=NL+1
 Q
IMPL Q:$N(^[QUI]FLIMPLI(A,-1))=-1  D TETE
 W !,"***************************"
 W !,$$^%QZCHW("*  Parametres implicites  *")
 W !,"***************************",! S NL=NL+4
 S N=-1 F %N=0:0 S N=$N(^[QUI]FLIMPLI(A,N)) Q:N=-1  I ('($F(N,"$ARG",0)))&('($F(N,"%VAL",0))) S P=-1 F %P=0:0 S P=$N(^[QUI]FLIMPLI(A,N,P)) Q:P=-1  S CH=^[QUI]FLIMPLI(A,N,P),UN=$P(CH,"^",1) D AFFI
 Q
AFFI D:NL>(NBL-7) TETE W !,!,N
 W !,$$^%QZCHW("  Unite     : "),UN S NL=NL+3
 F I=1:1:4 I $P(CH,"^",((I-1)*4)+2)'="" W ! W:I=1 $$^%QZCHW("  Condition : ") W ?20,$P(CH,"^",((I-1)*4)+2),?30," ",$P(CH,"^",((I-1)*4)+3),?40," ",$P(CH,"^",((I-1)*4)+4) W:(I'=4)&($P(CH,"^",(I*4)+2)'="") ?50," ",$P(CH,"^",((I-1)*4)+5) S NL=NL+1
 S MSG=$P(CH,"^",18) W !,$$^%QZCHW("  Action    : "),?20,MSG S NL=(NL+1)+$S($L(MSG)>120:$L(MSG)/120,1:0)
 Q
 
CTRLC U 0 D POCLEPA^%VVIDEO,^%VSQUEAK W $ZE,$$^%QZCHW("Arret volontaire ...") H 2 D POCLEPA^%VVIDEO G END
 
TETE W #
 W !,$$^%QZCHW("Le "),$$DATE^%QMDATE,$$^%QZCHW(" a "),$$HEURE^%QMDATE,?30,$$^%QZCHW("Page "),NP,?50,$$^%QZCHW("*** Yexpert, systeme TOTEM ***") S NP=NP+1,NL=7
 S MSG=^TABIDENT(WHOIS,"ENTETE")_$$^%QZCHW(" -  Synthese du SF pour ")_A_$$^%QZCHW($$PCONF^%INCASTO("NOMHOST")_" - YEXPERT ("_^INCONNE("VERSION")_")")
 W !,!,?20,$E("****************************************************************************************************************************************************",1,$L(MSG)+6)
 W !,?20,"*  ",MSG,"  *"
 W !,?20,$E("****************************************************************************************************************************************************",1,$L(MSG)+6)
 W !,!
 Q

