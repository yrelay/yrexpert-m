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

;%QSVERI3^INT^1^59547,73883^0
QSVERI3 ;
VERIF3 
 
 
 
 N BOOL,REP1,REP2,REP3,I,J,K,LIAI,LIEN,U,MSG,LINV,CH
 S REP1=""
 F I=0:0 S REP1=$O(@TEMPO@(M,"LIES",REP1)) Q:REP1=""  D VER31
 D VERLI^%QSVERI7
 Q
 
VER31 S REP2=""
 F J=0:0 S REP2=$O(@TEMPO@(M,"LIES",REP1,REP2)) Q:REP2=""  S LIEN="" F U=0:0 S LIEN=$O(@TEMPO@(M,"LIES",REP1,REP2,LIEN)) Q:LIEN=""  S CH=@TEMPO@(M,"LIES",REP1,REP2,LIEN),LIAI=$P(CH,"^",1),LINV=$P(CH,"^",2) D TEST,STOCLI^%QSVERI7 D:BOOL=1 VER32
 Q
 
 
 
 
 
 
TEST S REP3=$O(@TEMPO@(M,"NOM INTERNE","")),BOOL=0
 F K=0:0 Q:(REP3="")!(BOOL=1)  S:REP3=REP2 BOOL=1 S REP3=$O(@TEMPO@(M,"NOM INTERNE",REP3))
 I BOOL=0 S SYNTAX=1,%VAR=REP1_$$^%QZCHW(" et ")_REP2_$$^%QZCHW(" sont en relation mais le repertoire ")_REP2_$$^%QZCHW(" n'existe pas..."),ERREUR="<SYNTAX>" D WRITE^%QSVERER
 I REP1=REP2,(LIAI'=4)&(LIAI'=5) S BOOL=0,%VAR=REP1_$$^%QZCHW(" est en relation avec lui-meme mais ")_LIEN_$$^%QZCHW(" n'est pas un lien involutif..."),ERREUR="<SYNTAX>",SYNTAX=1 D WRITE^%QSVERER
 I (LIAI=4)!(LIAI=5),REP1'=REP2 S BOOL=0,%VAR=LIEN_$$^%QZCHW(" est un lien involutif mais les repertoires ")_REP1_$$^%QZCHW(" et ")_REP2_$$^%QZCHW(" sont differents..."),ERREUR="<SYNTAX>",SYNTAX=1 D WRITE^%QSVERER
 Q
VER32 
 D:LIAI=1 VER33 D:LIAI=2 VER34 D:LIAI=3 VER35
 D:LIAI=4 VER36^%QSVERI7 D:LIAI=5 VER37^%QSVERI7
 Q
 
 
 
VER33 S MSG=REP1_$$^%QZCHW(" est le fils de ")_REP2_$$^%QZCHW(" via ")_LIEN_$$^%QZCHW(" : ")
 I '($D(@TEMPO@(M,"LIES",REP2,REP1,LINV))) S ERREUR="<SYNTAX>",%VAR=MSG_$$^%QZCHW("il manque le lien reciproque...") D WRITE^%QSVERER S SYNTAX=1 Q
 I @TEMPO@(M,"LIES",REP2,REP1,LINV)=1 S ERREUR="<SYNTAX>",%VAR=MSG_$$^%QZCHW("il ne peut pas en plus etre son pere...") D WRITE^%QSVERER S SYNTAX=1
 I @TEMPO@(M,"LIES",REP2,REP1,LINV)=3 S ERREUR="<SYNTAX>",%VAR=MSG_$$^%QZCHW("le lien reciproque ne peut pas etre relationnel...") D WRITE^%QSVERER S SYNTAX=1
 I (@TEMPO@(M,"LIES",REP2,REP1,LINV)=4)!(@TEMPO@(M,"LIES",REP2,REP1,LINV)=5) S ERREUR="<SYNTAX>",%VAR=MSG_$$^%QZCHW("le lien reciproque ne peut pas etre involutif...") D WRITE^%QSVERER S SYNTAX=1
 Q
 
 
 
VER34 S MSG=REP1_$$^%QZCHW(" est le pere de ")_REP2_$$^%QZCHW(" via ")_LIEN_$$^%QZCHW(" : ")
 I '($D(@TEMPO@(M,"LIES",REP2,REP1,LINV))) S ERREUR="<SYNTAX>",%VAR=MSG_$$^%QZCHW("il manque le lien reciproque...") D WRITE^%QSVERER S SYNTAX=1 Q
 I @TEMPO@(M,"LIES",REP2,REP1,LINV)=2 S ERREUR="<SYNTAX>",%VAR=MSG_$$^%QZCHW("il ne peut pas en plus etre son fils...") D WRITE^%QSVERER S SYNTAX=1
 I @TEMPO@(M,"LIES",REP2,REP1,LINV)=3 S ERREUR="<SYNTAX>",%VAR=MSG_$$^%QZCHW("le lien reciproque ne peut pas etre relationnel...") D WRITE^%QSVERER S SYNTAX=1
 I (@TEMPO@(M,"LIES",REP2,REP1,LINV)=4)!(@TEMPO@(M,"LIES",REP2,REP1,LINV)=5) S ERREUR="<SYNTAX>",%VAR=MSG_$$^%QZCHW("le lien reciproque ne peut pas etre involutif...") D WRITE^%QSVERER S SYNTAX=1
 Q
 
 
 
VER35 S MSG=REP1_$$^%QZCHW(" est en relation avec ")_REP2_$$^%QZCHW(" via ")_LIEN_$$^%QZCHW(" : ")
 I '($D(@TEMPO@(M,"LIES",REP2,REP1,LINV))) S ERREUR="<SYNTAX>",%VAR=MSG_$$^%QZCHW("il manque le lien reciproque...") D WRITE^%QSVERER S SYNTAX=1 Q
 I @TEMPO@(M,"LIES",REP2,REP1,LINV)=1 S ERREUR="<SYNTAX>",%VAR=MSG_$$^%QZCHW("il ne peut pas en etre le pere... ") D WRITE^%QSVERER S SYNTAX=1
 I @TEMPO@(M,"LIES",REP2,REP1,LINV)=2 S ERREUR="<SYNTAX>",%VAR=MSG_$$^%QZCHW("il ne peut pas en etre le fils....") D WRITE^%QSVERER S SYNTAX=1
 I (@TEMPO@(M,"LIES",REP2,REP1,LINV)=4)!(@TEMPO@(M,"LIES",REP2,REP1,LINV)=5) S ERREUR="<SYNTAX>",%VAR=MSG_$$^%QZCHW("le lien reciproque ne peut pas etre involutif...") D WRITE^%QSVERER S SYNTAX=1
 Q

