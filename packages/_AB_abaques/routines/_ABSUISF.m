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

;%ABSUISF^INT^1^59547,73864^0
ABSUISF ;
 
INIT S %DOS=0,QUCOM=%UCI,AQUI=QUI
QUES D CLEPAG^%VVIDEO S %SUIV=1,DX=0,DY=5 X XY W "Nom du protocole : " S DX=$X+1 D ^%VLEC G:(CTRLA=1)!((CTRLF=1)!(Y1="")) FIN G:Y1="?" LISTE S NOMG=Y1 D CONT G:CONT=0 QUES D ^%CGETPAR
DATE S DX=0,DY=DY+2 X XY W "Date : " S DX=$X+1 D ^%VLEC G:CTRLA=1 FIN G:CTRLF=1 QUES
 S JR=Y1,REFUSE=0 D CTRDAT+2^%VYDAT G:REFUSE=1 DATE S DX=12 X XY W DAAT S DATS=DAAT
 D CLEPAG^%VVIDEO,TETE K VALCLE S LH=6,LB=17,VALCLE(1)=DATS,VALCLE(2)=NOMG,NOMTAB="^[QUS]SUIV" D ^MBSUIV,^CPAGISUI G QUES
CONT S CONT=1 I $D(^[QUI]SCRC(NOMG)) S %OWN=1,(QUS,QUW,QU)=QUI G FIN
 I $D(^[QUCOM]SCRC(NOMG)) S %OWN=0,(QUS,QUW,QU)=QUCOM G FIN
 S CONT=0 D POCLEPA^%VVIDEO W "Grille inconnue ! [RETURN] pour continuer. " R *REP G FIN
FIN Q
LISTE D CLEPAG^%VVIDEO,LISTE^CDELGRIL,CLEPAG^%VVIDEO G QUES
TETE S MSG=^[QU]SCRC(NOMG,"TITRE")_"     Suivi du "_DATS,LMSG=$L(MSG),DY=1,DX=40-(LMSG\2) D INVDEO^%VZEAVT Q

