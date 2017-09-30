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

;%TXBPRIX^INT^1^59547,74031^0
%TXBPRIX ;;06:01 PM  3 Sep 1993
 
 
 
 
 S RES=$$CHOIX
 I RES="" G MENU^%TXB
 S OBJET=$P(RES,$C(0))
 S:OBJET="COMMANDE" COMM=$P(RES,$C(0),2)
 S:OBJET="CONTRAT" CNTRA=$P(RES,$C(0),2)
 S @PILE=@PILE+1,@PILE@(@PILE)=OBJET
 S POSX=@PILE*4,POSY=((@PILE-1)*3)+1
 S FIXED(OBJET)=1
 D CURON^%VVIDEO
 S STO="STOCK",VAL="VALDEF"
 S GLO=$$CONCAS^%QZCHAD(ECRAN,OBJET)
 S NBKEY=@GG@(OBJET,"NBCHAMPS")
 S NBC=(NBKEY*2)-1
 W /WOPEN(POSX,POSY,58,(NBKEY*2)+4,"","","","","tc"),/COLOR(@GG@(OBJET,"FOREGROUND"),@GG@(OBJET,"BACKGROUND")),/CLR
 K VALDEF F I=1:1:NBC S VALDEF(I)=""
 S VALDEF="STOCK"
 K STOCK
 G:OBJET="CONTRAT" G30^%TXB
 G:OBJET="COMMANDE" G40^%TXB
 G MENU^%TXB
 
CHOIX() N CT,CTC,FR,GLO,PRX,%P,NT,%NT,LIGSEL
 N GCHOIX
 S GLO=$$TEMP^%SGUTIL,GCHOIX=$$TEMP^%SGUTIL
 S CT=""
NXCT S CT=$$NXTRIAO^%QSTRUC8("ARTICLE",ART,"CONTRAT.ETABLI",CT) G:CT="" SUITE
 S CTC=ART_","_CT
 S FR=$$^%QSCALVA("CONTRAT",CTC,"FOURNISSEUR.RETENU") G:FR="" NXCT
 S PRX=$$^%QSCALIN("CONTRAT",CTC,"PRIX.UNITAIRE",1)
 G:PRX="" COMM
 S @GLO@(PRX,CT)=FR_$C(0)_"CONTRAT"_$C(0)_CTC
 G NXCT
COMM S NOC=""
NXCOMM S NOC=$$NXTRIAO^%QSTRUC8("CONTRAT",CTC,"COMMANDE.DU.CONTRAT",NOC)
 G:NOC="" NXCT
 S NOCC=CTC_","_NOC
 S PRX=$$^%QSCALIN("COMMANDE",NOCC,"PRIX.UNITAIRE",1) G:PRX="" NXCOMM
 S @GLO@(PRX,NOC)=FR_$C(0)_"COMMANDE"_$C(0)_NOCC
 G NXCOMM
 
 
SUITE S PRX="" F %P=0:0 S PRX=$O(@GLO@(PRX)) Q:PRX=""  S NT="" F %NT=0:0 S NT=$O(@GLO@(PRX,NT)) Q:NT=""  S VV=@GLO@(PRX,NT),@GCHOIX@(PRX_" "_NT_"  ("_$P(VV,$C(0),2)_")")=$P(VV,$C(0),2,3)
 S LIGSEL=$$QUCHOIP^%TXBPRIM(GCHOIX,"prix de "_ART,5,5,60,15)
 Q:LIGSEL="" ""
 S RES=@GCHOIX@(LIGSEL)
 Q RES

