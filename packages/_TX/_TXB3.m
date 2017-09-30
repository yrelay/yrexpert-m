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

;%TXB3^INT^1^59547,74031^0
%TXB3 ;;04:05 PM  11 Oct 1993; ; 26 Mar 93  4:18 PM
 
 
CONS 
 K STOCK,VALDEF S VALDEF="STOCK"
 S NIX=$C(0)
 G:OBJET="ARTICLE" CNS1 G:OBJET="FOURNISSEUR" CNS2 G:OBJET="CONTRAT" CNS3 G:OBJET="COMMANDE" CNS4 G:OBJET="LIVRAISON" CNS5
 
CNS1 
 S ART2=$S(FIXED("FOURNISSEUR"):$$SUIVAF^%TXBSUI(ART,FRN),1:$$SUIVA^%TXBSUI(ART))
 I ART2="" D ECHEC Q
 S ART=ART2
 F I=1:1:3 S VALDEF(I)=""
 I $$IR^%QSGE5("ARTICLE",ART) S VALDEF(1)=ART,VALDEF(3)=$$^%QSCALIN("ARTICLE",ART,"DESIGNATION",1)
 G CNSF
 
CNS2 
 S FRN2=$S(FIXED("CONTRAT"):$$SUIVFC^%TXBSUI(FRN,CONTR),FIXED("COMMANDE"):$$SUIVFM^%TXBSUI(FRN,COMM),FIXED("LIVRAISON"):$$SUIVFL^%TXBSUI(FRN,LIVR),FIXED("ARTICLE"):$$SUIVFA^%TXBSUI(FRN,ART),1:$$SUIVF^%TXBSUI(FRN))
 I FRN2="" D ECHEC Q
 S FRN=FRN2
 S VALDEF(1)=""
 I $$IR^%QSGE5("FOURNISSEUR",FRN) S VALDEF(1)=FRN
 G CNSF
 
CNS3 
 S CNTRA2=$S(FIXED("ARTICLE")&FIXED("FOURNISSEUR"):$$SUIVCAF^%TXBSUI(CNTRA,ART,FRN),FIXED("ARTICLE"):$$SUIVCA^%TXBSUI(CNTRA,ART),FIXED("FOURNISSEUR"):$$SUIVCF^%TXBSUI(CNTRA,FRN),1:$$SUIVC^%TXBSUI(CNTRA))
 I CNTRA2="" D ECHEC Q
 S CNTRA=CNTRA2
 F I=1:1:5 S VALDEF(I)=""
 S VALDEF(1)=$P(CNTRA,",",2),VALDEF(3)=$P(CNTRA,","),VALDEF(5)=$$^%QSCALVA("CONTRAT",CNTRA,"FOURNISSEUR.RETENU")
 D CMS^%TXBM3
 G CNSF
 
 
CNS4 
 S COMM2=$S(FIXED("CONTRAT"):$$SUIVMC^%TXBSUI(COMM,CNTRA),FIXED("ARTICLE"):$$SUIVMA^%TXBSUI(COMM,ART),FIXED("FOURNISSEUR"):$$SUIVMF^%TXBSUI(COMM,FRN),1:$$SUIVM^%TXBSUI(COMM))
 I COMM2="" D ECHEC Q
 S COMM=COMM2
 F I=1:1:4 S VALDEF(I)=""
 S VALDEF(1)=$P(COMM,",",3),VALDEF(2)=$P(COMM,","),VALDEF(3)=$P(COMM,",",2),VALDEF(4)=$$^%QSCALVA("CONTRAT",$P(COMM,",",1,2),"FOURNISSEUR.RETENU")
 G CNSF
 
 
CNS5 
 S LIVR2=$S(FIXED("COMMANDE"):$$SUIVLM^%TXBSUI(LIVR,COMM),FIXED("ARTICLE"):$$SUIVLA^%TXBSUI(LIVR,ART),1:$$SUIVL^%TXBSUI(LIVR))
 I LIVR2="" D ECHEC Q
 S LIVR=LIVR2
 F I=1:1:5 S VALDEF(I)=""
 S VALDEF(1)=$P(LIVR,",",4),VALDEF(2)=$P(LIVR,",",3),VALDEF(3)=$P(LIVR,","),VALDEF(4)=$P(LIVR,",",2),VALDEF(5)=$$^%QSCALVA("CONTRAT",$P(LIVR,",",1,2),"FOURNISSEUR.RETENU")
 G CNSF
 
CNSF 
 D AFF^%PKSAISI(0,0,1,0,1,GLO,VAL,.ERR)
 Q
 
 
ECHEC W /COLOR(7,6),/WOPEN(40,3,35,1,1,"","","","tc") D CUROF^%VVIDEO
 W "recherche epuisee [return]" R *zzz
 D CURON^%VVIDEO W /WCLOSE,/AA
 Q

