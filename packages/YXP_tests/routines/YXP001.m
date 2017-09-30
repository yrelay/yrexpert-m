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
;! Nomprog     : YXP001                                                       !
;! Module      : Systeme                                                      !
;! But         : Programme de test                                            !
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
;! HL002 ! HL     ! 10/06/12 ! Déplacement de /usr/local/ vers /opt/          !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

YXP001 ;
 Q

NET
 K ^MODEPAS
 K ^TABIDENT
 K ^%SCREC
 K ^%SCRE
 K ^RQSMDL9
 K ^%YEXPERT
 K ^CacheTempEWDSession
 K ^RPC
 Q

FREAD
 R "Fichier : ",FIC
 O FIC:(readonly:exception="G BADOPEN")
 U FIC:exception="G EOF"
 F  U FIC R x U $P W x,!
EOF
 I '$ZEOF ZM +$ZS
 C FIC
 Q
BADOPEN
 I $P($ZS,",",1)=2 D  Q
 . W !,"Le fichier ",FIC," n'existe pas.",!
 I $P($ZS,",",1)=13 D  Q
 . W !,"Le fichier ",FIC," n'est pas accessible.",!
 ZM +$ZS
 Q

LIREFIC
 S FIC="/opt/yxp/r/YXP002.m"
 O FIC:(readonly:exception="G BADOPEN2")
 U FIC:exception="G EOF2"
 ;F I=FIRST:1 U FIC R A S STATUS=$ZS,ST=$P(STATUS,",",1) Q:ST=3  Q:$A(A)=22  S @GLO@(I)=A
 F  U FIC R x U $P W x,!
EOF2
 I '$ZEOF ZM +$ZS
 C FIC
 Q
BADOPEN2
 I $P($ZS,",",1)=2 D  Q
 . W !,"Le fichier ",FIC," n'existe pas.",!
 I $P($ZS,",",1)=13 D  Q
 . W !,"Le fichier ",FIC," n'est pas accessible.",!
 ZM +$ZS
 Q






