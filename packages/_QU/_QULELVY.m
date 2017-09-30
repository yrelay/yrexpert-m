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
;! Nomprog     : %QULELVY                                                     !
;! Module      : EDITEUR EN LIEN                                              !
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

%QULELVY ;
 
 
 
 
 
 
 
PAGE(DIR,NCDEB,NLDEB,NCC,NLC) 
 N %AA,%BB,LV,CV
 G @("P"_DIR)
P6 S %AA=(NCDEB+COLAF)+1,%BB=NLDEB G FPAGE
P4 S %AA=$S(NCDEB>COLAF:NCDEB-(COLAF+1),1:1),%BB=NLDEB G FPAGE
P2 S %AA=NCDEB,%BB=NLDEB+LIGAF G FPAGE
P8 S %AA=NCDEB,%BB=$S(NLDEB>LIGAF:NLDEB-LIGAF,1:1) G FPAGE
FPAGE Q:(%AA=NCDEB)&(%BB=NLDEB) 0
 F LV=%BB:1:(%BB+LIGAF)-1 F CV=%AA:1:(%AA+COLAF)-1 G:$D(@GY@(CV,LV,"C")) OKPAGE
 Q 0
OKPAGE S NCDEB=%AA,NLDEB=%BB,NCC=CV,NLC=LV Q 1
 
 
 
 
 N CV,LV,%I,SP
 S CV=NCC,LV=NLC G @("TT"_DIR)
TTRK I $D(@GY@(CV,LV,"F")) S LV=$O(@GY@(CV,LV,"F","")),CV=CV+2 G FINFL
TTRK2 I CV=1 F %I=0:0 S LV=$O(@GY@(CV,LV)) G:LV="" FLE0 G:$D(@GY@(CV,LV,"C")) FINFL
 S SP=@GY@(CV,LV,"P"),LV=$O(@GY@(CV-2,SP,"F",LV)) G:LV'="" FINFL S CV=CV-2,LV=SP G TTRK2
TTLK G:'($D(@GY@(CV,LV,"P"))) FLE0 S LV=@GY@(CV,LV,"P"),CV=CV-2 G FINFL
TTDK I $D(@GY@(CV,LV,"F")) S LV=$O(@GY@(CV,LV,"F","")),CV=CV+2
TTDK2 I CV=1 F %I=0:0 S LV=$O(@GY@(CV,LV)) G:LV="" FLE0 G:$D(@GY@(CV,LV,"C")) FINFL
 S SP=@GY@(CV,LV,"P"),LV=$O(@GY@(CV-2,SP,"F",LV)) G:LV'="" FINFL S LV=SP,CV=CV-2 G TTDK2
TTUK 
 ;HL I CV=1 F %I=1:1 S LV=$ZP(@GY@(CV,LV)) G:LV="" FLE0 G:$D(@GY@(CV,LV,"C")) FINFL
 I CV=1 F %I=1:1 S LV=$O(@GY@(CV,LV),-1) G:LV="" FLE0 G:$D(@GY@(CV,LV,"C")) FINFL
 ;HL S SP=@GY@(CV,LV,"P"),LV=$ZP(@GY@(CV-2,SP,"F",LV)) G:LV'="" FINFL S CV=CV-2,LV=SP G TTUK
 S SP=@GY@(CV,LV,"P"),LV=$O(@GY@(CV-2,SP,"F",LV),-1) G:LV'="" FINFL S CV=CV-2,LV=SP G TTUK
FINFL I (((CV'<NCDEB)&(LV'<NLDEB))&(CV<(NCDEB+COLAF)))&(LV<(NLDEB+LIGAF)) S NCC=CV,NLC=LV Q 1
 S:(CV<NCDEB)!(CV'<(NCDEB+COLAF)) NCDEB=$S(((NCDEB-NCC)+CV)>0:(NCDEB-NCC)+CV,1:1)
 S:(LV<NLDEB)!(LV'<(NLDEB+LIGAF)) NLDEB=$S(((NLDEB-NLC)+LV)>0:(NLDEB-NLC)+LV,1:1)
 S NCC=CV,NLC=LV
 Q 1
FLE0 Q 0
 
 
 
 
FLECHE(DIR,NCDEB,NLDEB,NCC,NLC) 
 N CV,LV,%I,SP
 S CV=NCC,LV=NLC G @("TF"_DIR)
TFRK S CV=CV+2 F %I=0:0 G:$D(@GY@(CV,LV,"C")) TFINFL S LV=$O(@GY@(CV,LV)) G:LV="" TFLE0
 
TFLK I $D(@GY@(CV,LV,"P")) S LV=@GY@(CV,LV,"P"),CV=CV-2 G TFINFL
 ;HL F %I=0:0 S LV=$ZP(@GY@(CV,LV)) G:LV="" TFLE0 G:$D(@GY@(CV,LV,"C")) TFINFL
 F %I=0:0 S LV=$O(@GY@(CV,LV),-1) G:LV="" TFLE0 G:$D(@GY@(CV,LV,"C")) TFINFL
 
TFDK S SP=LV
 F %I=0:0 S LV=$O(@GY@(CV,LV)) Q:LV=""  G:$D(@GY@(CV,LV,"C")) TFINFL
 I $D(@GY@(CV,SP,"F")) S LV=SP,CV=CV+2 G TFINFL
 G TFLE0
 
TFUK S SP=LV
 ;HL F %I=1:1 S LV=$ZP(@GY@(CV,LV)) Q:LV=""  G:$D(@GY@(CV,LV,"C")) TFINFL
 F %I=1:1 S LV=$O(@GY@(CV,LV),-1) Q:LV=""  G:$D(@GY@(CV,LV,"C")) TFINFL
 
 G:CV=1 TFLE0
 S LV=@GY@(CV,SP,"P"),CV=CV-2 G TFINFL
 
TFINFL I (((CV'<NCDEB)&(LV'<NLDEB))&(CV<(NCDEB+COLAF)))&(LV<(NLDEB+LIGAF)) S NCC=CV,NLC=LV Q 1
 S:(CV<NCDEB)!(CV'<(NCDEB+COLAF)) NCDEB=$S(((NCDEB-NCC)+CV)>0:(NCDEB-NCC)+CV,1:1)
 S:(LV<NLDEB)!(LV'<(NLDEB+LIGAF)) NLDEB=$S(((NLDEB-NLC)+LV)>0:(NLDEB-NLC)+LV,1:1)
 S NCC=CV,NLC=LV
 Q 1
TFLE0 Q 0
 ;
 ;

