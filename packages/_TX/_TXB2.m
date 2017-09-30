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

;%TXB2^INT^1^59547,74031^0
%TXB2 ;;04:05 PM  11 Oct 1993; ; 26 Mar 93  4:18 PM
 
 
 
 
AJ K STOCK,VALDEF S VALDEF="STOCK"
 G:OBJET="ARTICLE" AJ1 G:OBJET="FOURNISSEUR" AJ2 G:OBJET="CONTRAT" AJ3 G:OBJET="COMMANDE" AJ4 G:OBJET="LIVRAISON" AJ5
 
 
AJ1 F I=1:1:3 S VALDEF(I)=""
 D ^%PKSAISI(0,0,1,0,1,GLO,VAL,.ERR) Q:'($D(STOCK))
 S ART=$P(STOCK,$C(0))
 I '($$IR^%QSGE5("ARTICLE",ART)) S X=$$CREER^%QSGEIND("ARTICLE",ART,"",1,.MSG) D DEFART^%TXBSAIS(ART)
 I FIXED("FOURNISSEUR"),'($$OAIR^%QSGE5("ARTICLE",ART,"FOURNISSEUR.POSSIBLE",FRN)) D ADDS^%QSGEST3("ARTICLE",ART,"FOURNISSEUR.POSSIBLE","FOURNISSEUR",FRN)
 Q
 
 
AJ2 S VALDEF(1)=""
 D ^%PKSAISI(0,0,1,0,1,GLO,VAL,.ERR) Q:'($D(STOCK))
 S FRN=$P(STOCK,$C(0))
 I '($$IR^%QSGE5("FOURNISSEUR",FRN)) S X=$$CREER^%QSGEIND("FOURNISSEUR",FRN,"",1,.MSG) D DEFFRN^%TXBSAI2(FRN)
 I FIXED("ARTICLE"),'($$OAIR^%QSGE5("ARTICLE",ART,"FOURNISSEUR.POSSIBLE",FRN)) D ADDS^%QSGEST3("ARTICLE",ART,"FOURNISSEUR.POSSIBLE","FOURNISSEUR",FRN)
 Q
 
 
AJ3 F I=1:1:5 S VALDEF(I)=""
 S VALDEF(1)=$$GEN^%QCAPOP("CNT")
 I FIXED("ARTICLE") S VALDEF(3)=ART
 I FIXED("FOURNISSEUR") S VALDEF(5)=FRN
 D AJOUT^%TXBM3
 D SUIVPREC^%TXBM3
 D ^%PKSAISI(0,0,1,0,1,GLO,VAL,.ERR) Q:'($D(STOCK))
 S NCT=$P(STOCK,$C(0),1)
 S ART=$P(STOCK,$C(0),3)
 S FRN=$P(STOCK,$C(0),5)
 S CNTRA=ART_","_NCT
 S X=$$CREER^%QSGEIND("CONTRAT",CNTRA,NCT,1,.MSG)
 D ADDS^%QSGEST3("CONTRAT",CNTRA,"FOURNISSEUR.RETENU","FOURNISSEUR",FRN)
 I '($$OAIR^%QSGE5("ARTICLE",ART,"FOURNISSEUR.POSSIBLE",FRN)) D ADDS^%QSGEST3("ARTICLE",ART,"FOURNISSEUR.POSSIBLE","FOURNISSEUR",FRN)
 D DEFCONTR^%TXBSAI3(CNTRA)
 Q
 
 
AJ4 F I=1:1:4 S VALDEF(I)=""
 S NIX=$C(0)
 S VALDEF(1)=$$GEN^%QCAPOP("COM"),NIX=1_$C(0)
 I FIXED("ARTICLE") S VALDEF(2)=ART,NIX=2_$C(0)
 I FIXED("FOURNISSEUR") S VALDEF(4)=FRN,NIX=4_$C(0)
 I FIXED("CONTRAT") S VALDEF(3)=$P(CNTRA,",",2),VALDEF(2)=$P(CNTRA,","),VALDEF(4)=$$^%QSCALVA("CONTRAT",CNTRA,"FOURNISSEUR.RETENU"),NIX=NIX_2_$C(0)_3_$C(0)_4_$C(0)
 D ^%PKSAISI(0,0,1,0,1,GLO,VAL,.ERR) Q:'($D(STOCK))
 S NCM=$P(STOCK,$C(0),1)
 S ART=$P(STOCK,$C(0),2)
 S CNTRA=ART_","_$P(STOCK,$C(0),3)
 S COMM=CNTRA_","_NCM
 S FRN=$P(STOCK,$C(0),4)
 S X=$$CREER^%QSGEIND("COMMANDE",COMM,"",1,.MSG)
 I '($$OAIR^%QSGE5("CONTRAT",CNTRA,"FOURNISSEUR.RETENU",FRN)) D ADDS^%QSGEST3("CONTRAT",CNTRA,"FOURNISSEUR.RETENU","FOURNISSEUR",FRN)
 I '($$OAIR^%QSGE5("ARTICLE",ART,"FOURNISSEUR.POSSIBLE",FRN)) D ADDS^%QSGEST3("ARTICLE",ART,"FOURNISSEUR.POSSIBLE","FOURNISSEUR",FRN)
 D DEFCOMM^%TXBSAI4(COMM)
 Q
 
 
AJ5 F I=1:1:5 S VALDEF(I)=""
 S NIX=$C(0)
 S VALDEF(1)=$$GEN^%QCAPOP("LIV"),NIX=NIX_1_$C(0)
 I FIXED("ARTICLE") S VALDEF(3)=ART,NIX=NIX_3_$C(0)
 I FIXED("FOURNISSEUR") S VALDEF(5)=FRN,NIX=NIX_5_$C(0)
 I FIXED("CONTRAT") S VALDEF(4)=$P(CNTRA,",",2),VALDEF(3)=$P(CNTRA,","),VALDEF(5)=$$^%QSCALVA("CONTRAT",CNTRA,"FOURNISSEUR.RETENU"),NIX=NIX_4_$C(0)_3_$C(0)_5_$C(0)
 I FIXED("COMMANDE") S VALDEF(2)=$P(COMM,",",3),VALDEF(4)=$P(COMM,",",2),VALDEF(3)=$P(COMM,","),VALDEF(5)=$$^%QSCALVA("CONTRAT",CNTRA,"FOURNISSEUR.RETENU"),NIX=NIX_4_$C(0)_3_$C(0)_5_$C(0)_2_$C(0)
 D ^%PKSAISI(0,0,1,0,1,GLO,VAL,.ERR) Q:'($D(STOCK))
 S NLIV=$P(STOCK,$C(0),1)
 S ART=$P(STOCK,$C(0),3)
 S CNTRA=ART_","_$P(STOCK,$C(0),4)
 S COMM=CNTRA_","_$P(STOCK,$C(0),2)
 S LIVR=COMM_","_NLIV
 S FRN=$P(STOCK,$C(0),5)
 S X=$$CREER^%QSGEIND("LIVRAISON",LIVR,"",1,.MSG)
 I '($$OAIR^%QSGE5("CONTRAT",CNTRA,"FOURNISSEUR.RETENU",FRN)) D ADDS^%QSGEST3("CONTRAT",CNTRA,"FOURNISSEUR.RETENU","FOURNISSEUR",FRN)
 I '($$OAIR^%QSGE5("ARTICLE",ART,"FOURNISSEUR.POSSIBLE",FRN)) D ADDS^%QSGEST3("ARTICLE",ART,"FOURNISSEUR.POSSIBLE","FOURNISSEUR",FRN)
 D DEFLIVR^%TXBSAI5(LIVR)
 Q

