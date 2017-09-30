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

;%QSAJCM4^INT^1^59547,73880^0
%QSAJCM4 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
AFF D TITRE
 D AFF^%QUCHOIP Q
TITRE 
 D CLEPAG^%VVIDEO
 
 
 D CADHG
 D REV^%VVIDEO S DX=(LFGA-41)\2,DY=1 X XY W $$^%QZCHW("A C C E S   A U X   R E P E R T O I R E S")
 D NORM^%VVIDEO Q
CADHD Q
 D CARSP^%VVIDEO(LFGA,0,HFHA,LECR-LFGA,1) Q
CADDR D CARSP^%VVIDEO(0,YBA,HFBA,LFGA,1) Q
CADHG D CARSP^%VVIDEO(0,0,HFHA,LFGA,1) Q
CADGA D CARSP^%VVIDEO(0,HFHA,HFMI,LFGA,1) Q
CLFGA O $I D CLFEN^%VVIDEO(0,HFHA,HFMI,LFGA) Q
CLFDR O $I D CLFEN^%VVIDEO(0,YBA,HFBA,LFDR)
 S FDM=0,FDMI=0 Q
CLIND D POCLEPA^%VVIDEO
 Q
 O $I S DX=LFGA+1,DY=HFHA+1
 X XY W $J("",LFDR-2) Q
CLNIN 
 S DX=SAVX(PIL),DY=SAVY(PIL)
 X XY W $J("",$L(INDIV)) Q
CLHIE(H) 
 S DX=0,DY=(HFHA+H)-1 X XY W $J(" ",LFGA)
 Q
 X XY W $J("",LFGA)
 S DY=DY+1 X XY W $J("",LFGA) Q
AFIND(I) 
 S DX=SAVX(PIL),DY=SAVY(PIL)
 X XY W $$M^%QAX(I) Q
AFREP(R) 
 S DX=(PIL-1)*3,DY=(HFHA+PIL)-1
 X XY D BLD^%VVIDEO,REV^%VVIDEO W $$^%QZCHW(R)," : "
 S SAVX(PIL)=$S(MODTM:$X,1:$X-3),SAVY(PIL)=$Y
 D NORM^%VVIDEO
 Q
 
AFFHIE(SPIL) 
 F PIL=1:1:SPIL D AFREP($$NOMLOG^%QSF($P(PIL(PIL),"^",2))),AFIND($P(PIL(PIL),"^"))
 S PIL=SPIL
 Q
 
SIGNAL Q:'($D(^RQSMOD5(MODEL,REPI)))
 D @("^"_$P(^RQSMOD5(MODEL,REPI),"^",1)_"("_""""_REPI_""","""_RIND_""")") Q
AFFI 
 D ^%VZEATT
 S FDM=1
 D INIT^%QSINDIV(MODEL,REPI,RIND,0,YBA,HFBA-1,LECR,LECR)
 D AFF2^%QSINDIV(MODEL,REPI,RIND,0,YBA,HFBA-1,LECR,LECR)
 K ^ATTREP($J),^RQSINDIV($J) Q
AFF2 
 D 80^%VVIDEO,TITRE^%QSAJCM4,AFREP^%QSAJCM4($$NOMLOG^%QSF(REPI)),AFIND^%QSAJCM4(INDIV)
 Q
M1(M) D POCLEPA^%VVIDEO W $$^%QZCHW(M) Q
M(M) D ^%VZEAVT($$^%QZCHW(M)) Q
CHOIX() N I,L,O,R,RB,RI G:PIL=1 CHOK
 S L=$$TEMP^%SGUTIL
 S O=PIL(PIL-1),RI=$P(O,"^",7),RB=$P(O,"^",2),I=$P(O,"^",5) D LISTVAL^%QSTRUC8(RB,I,RI,L) G:'($$AIR^%QSGEST5(RB,I,RI)) MES G LIS
CHOK S L=$$LISTIND^%QSGEST6(REPI) G:'($$REPVID^%QSGEST5(REPI)) LIS
MES D M("Aucun individu") S FDMI=1 Q ""
LIS D INIT2^%QUCHOIP(L,1,"",0,YBA,LECR,HFBA,LECR)
 O $I D AFF^%QUCHOIP S R=$$UN^%QUCHOIP D END^%QUCHOIP
 S FDM=1 Q R

