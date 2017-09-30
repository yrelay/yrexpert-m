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

;%QGQNT^INT^1^59547,73876^0
%QGQNT ;;04:07 PM  3 Nov 1992; ; 03 Nov 92  4:47 PM
 
 
 
 
GETQNT(OBJ,LOT,QUANTITE) 
 N %C,%R,PK,X,Y,GLO,I,STO,VAL,VALDEF,STOCK,SOR
 D CLEPAG^%VVIDEO
 S STO="STOCK",VAL="VALDEF"
 S GLO=$$TEMP^%SGUTIL
 D INIT
 
 F I=1:1:5 S VALDEF(I)=""
 S VALDEF(5)=QUANTITE
 S VALDEF="STOCK"
DEF 
 D ^%PKSAISI(0,0,1,0,1,GLO,VAL,.ERR)
 
 Q:'($D(STOCK)) 0
 
 
 S SOR=$P(STOCK,$C(0),5)
 K STOCK,@(GLO)
 Q SOR
 
INIT 
 N NBC,I,J,OBLIG,TJSOK,PLL
 
 S NBC=5
 
 
 
 
 
 
 S @GLO@("FL")="LDR"
 
 S @GLO=$$^%QZCHW("AFFECTATION")
 
 S @GLO@("H")=2,@GLO@("V")=6
 
 S @GLO@("NBC")=NBC
 
 S @GLO@("CHAMPS",1)=$$^%QZCHW("affectation de")_"         "
 S @GLO@("CHAMPS",2)="  "_OBJ
 S @GLO@("CHAMPS",3)=$$^%QZCHW("dans le lot")
 S @GLO@("CHAMPS",4)="  "_LOT
 S @GLO@("CHAMPS",5)=$$^%QZCHW("quantite a affecter")_"         "
 
 S PLL=0 F I=1:1:NBC I $L(@GLO@("CHAMPS",I))>PLL S PLL=$L(@GLO@("CHAMPS",I))
 S @GLO@("PLL")=PLL
 
 S @GLO@("L")=3 F I=1:1:NBC S @GLO@("LARG",I)=3
 
 S @GLO@("SUIV",5)=5,@GLO@("PREC",5)=5
 
 
 S @GLO@("POP1")="",@GLO@("POP2")=""
 
 
 
 
 
 S TJSOK=$XECUTE("S OK=1")
 
 
 S @GLO@("STO.DER")=1
 
 S @GLO@("BOU.AJOUT")=0,@GLO@("BOU.ERREUR")=1
 
 
 
 S @GLO@("EXEC.UCONT")="C"
 F I=1:1:NBC S @GLO@("UCONT.CHAMPS",I)=""
 S @GLO@("UCONT")=""
 
 
 
 F I=1:1:NBC S @GLO@("OBLIGAT",I)=TJSOK
 
 
 
 F I=1:1:NBC S @GLO@("FORMAT",I)=TJSOK
 
 
 F I=1:1:NBC S @GLO@("VALEG",I,0)=TJSOK
 Q
 ;
 ;

