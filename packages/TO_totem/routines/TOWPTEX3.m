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

;TOWPTEX3^INT^1^59547,74876^0
TOWPTEX3 ;
 
A 
 S GLO="^[QUI]WPTX(USR,DOC,VN,"
D D ^WPLOOKUP
 S VN=^[QUI]WPTX(USR,DOC,0),FORM=^(VN,"FORM"),LST=^("LAST")
F 
 S IO=$I,IOST=SUB,STOP=0,HAND=0 D SETUP^WPINT
 K LN,BEG,EN S X=""
GG S BEG="",EN="",PG="",FN=0
H S PRINT=PRINT+1,PRINT(PRINT)=FN_"^"_DOC_"^"_BEG_"^"_EN_"^"_PG,DOCNUM=PRINT
 W ! I (PRINT=1)!(IODES="") S IODES=$P(^("DES"),"^",2)
I S XY="",ROUGH=0 I IMPR'=0 S POP=0,IOP=IMPR,%X=IOP D RD1^%IS
 S NUM="N"
 S NUM=(NUM?1"O".E)!(NUM?1"o".E)
J D ^WPPRIN1 C:IMPR'=0 IMPR Q
R S B=0
R1 S B=$F(LL,$C(18),B) Q:'(B)  S F=$E(LL,B,B+1) Q:F=""  Q:'($D(@(GLO_"""R"",F)")))
 S ^[QUI]WPSCR($J,2,F)="" G R1
MW Q:AUTOMA'="A"
 Q:QUI'="YXP"  S:'($D(DOC)) DOC="" S DOC111=$E(DOC,1,1)
 S IMPR=^TABIDENT(WHOIS,"PRINTER"),IOP=IMPR O IMPR U IMPR C:IMPR'=0 IMPR
 Q

