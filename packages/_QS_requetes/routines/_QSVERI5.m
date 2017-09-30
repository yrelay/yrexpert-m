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

;%QSVERI5^INT^1^59547,73883^0
QSVERI5 ;
VERIF5 
 
 
 
 N N,NCLES,I,F,P,VRAI,PERE,OUI,FILS,J,AS,L,U
 S F=""
 F I=0:0 S F=$O(@TEMPO@(M,"NOMBRE DE CLES",F)) Q:F=""  S NCLES=@TEMPO@(M,"NOMBRE DE CLES",F) D:(NCLES<1)!((NCLES?.N)=0) VER40 D:(NCLES=1)&(NCLES?.N) VER41 D:(NCLES>1)&(NCLES?.N) VER42
 Q
 
VER40 S ERREUR="<SYNTAX>",%VAR=$$^%QZCHW("Pour le repertoire ")_F_" Ncles = "_NCLES_" ?...."
 D WRITE^%QSVERER S SYNTAX=1
 Q
VER41 S P="",VRAI=0,PERE=""
 F J=0:0 S P=$O(@TEMPO@(M,"LIES",F,P)) Q:P=""  S L="" F U=0:0 S L=$O(@TEMPO@(M,"LIES",F,P,L)) Q:L=""  S:$P(@TEMPO@(M,"LIES",F,P,L),"^",1)=1 VRAI=1,PERE=P
 I VRAI=0 Q
 S ERREUR="<SYNTAX>",%VAR=F_$$^%QZCHW(" a 1 seule cle et pourtant ce repertoire a un pere : ")_PERE
 D WRITE^%QSVERER S SYNTAX=1
 Q
VER42 S OUI=0,FILS=F,PERE=""
 F N=1:1 Q:PERE=FILS  S:N>1 FILS=PERE D VER421
 I (NCLES-1)=OUI Q
 I (NCLES-1)>OUI S ERREUR="<SYNTAX>",%VAR=F_$$^%QZCHW(" a ")_NCLES_$$^%QZCHW(" cles et pourtant ce repertoire n'a que ")_OUI_$$^%QZCHW(" ascendant(s) : "),SYNTAX=1 F MM=1:1:OUI S %VAR=%VAR_" "_AS(MM)_" "
 I (NCLES-1)<OUI S ERREUR="<SYNTAX>",%VAR=F_$$^%QZCHW(" a ")_NCLES_$$^%QZCHW(" cles et pourtant ce repertoire a "_OUI_" ascendant(s) : "),SYNTAX=1 F MM=1:1:OUI S %VAR=%VAR_" "_AS(MM)_" "
 D WRITE^%QSVERER
 Q
VER421 Q:FILS=""
 S P=""
 F J=1:1 S P=$O(@TEMPO@(M,"LIES",FILS,P)) Q:P=""  S L="" F U=0:0 S L=$O(@TEMPO@(M,"LIES",FILS,P,L)) Q:L=""  S:$P(@TEMPO@(M,"LIES",FILS,P,L),"^",1)=1 OUI=OUI+1,AS(N)=P,PERE=P
 Q

