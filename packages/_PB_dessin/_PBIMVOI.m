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

;%PBIMVOI^INT^1^59547,73873^0
PTIVISUA(O,V) 
 
 
 N BID,ECR,%FONC,I,PLACE,%PORT,%TERM
L0 D POCLEPA^%VVIDEO W "Visualisation sur (E)cran graphique ou (I)mprimante graphique ? [E] : " R *BID
 F I=1,6,13,69,73 G:I=BID @I
 D ^%VSQUEAK G L0
1 Q
6 Q
13 G 69
69 S %PORT=^TABIDENT(WHOIS,"ECRGRA"),%TERM=^TABIDENT(WHOIS,"TYPECR"),ECR=1
 D VISU Q
73 D POCLEPA^%VVIDEO W "Un instant ..."
 N %DESSIN
 S %PORT=^TABIDENT(WHOIS,"TABTRA"),%TERM=^TABIDENT(WHOIS,"TYPTAB"),ECR=0,%DESSIN=1
 D VISU Q
 
VISU C %PORT O %PORT U %PORT
 D:ECR=0 INIT4^%PBMFN(O,V)
 D:ECR=1 INIT^%PBMFN(O,V)
 D:(%PORT=0)!(%PORT=$I) CLEPAG^%VVIDEO,^%PBPZGRA
 S %FONC="INIT" D ^%PBPZ
 S %FONC="INIT.DESSIN" D ^%PBPZ
 S %FONC="CLEAR" D ^%PBPZ
 S %FONC="PRENDRE" D ^%PBPZ
 D CADRE^%PBP5EC2,MESUR^%PBP5EC2($$LEC^%PBSOV(O,V,"MESURE"))
 D ^%PBISAGE(O,V,0,0,0,1,1,0)
 S %FONC="PRINTER" D ^%PBPZ
 I (%PORT=0)!(%PORT=$I) D AFF^%PBMEN(0,0,"Termine [RETURN]") R *BID D ^%PBPZGRA,^%PBPZCLR,^%PBPZALF Q
 D ^%PBPZALF,POCLEPA^%VVIDEO
 C %PORT
 Q
 ;

