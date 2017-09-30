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

;%AMGAO2^INT^1^59547,73865^0
%AMGAO2 ;;04:58 PM  10 Aug 1993; ; 26 Mar 93  4:18 PM
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
FIND(TYPE,NJRN,NINST) 
 N NBKEY,TEMPCAR,I,GG,profondeur
 
 S profondeur="OUI"
 S GG=$$TEMP^%SGUTIL
 S NBKEY=^%RQSGLO("EXPLIC",@MOTEUR,"OBJET",TYPE,"NBCLEFS")
 F I=1:1:6 S @GG@(I)=""
 Q:'($$GET^%AMGAO2(GG,TYPE,$$^%QZCHW("derniere evolution d'un objet de type")_" "_TYPE)) -1
 S NINST=INST,NRJRN=JRN
 S @LAST=$C(0)_TYPE_$C(0)_@GG@(1)_$C(0)_@GG@(2)_$C(0)_@GG@(3)_$C(0)_@GG@(4)_$C(0)_@GG@(5)_$C(0)_@GG@(6)
 S RES=$$FIND^%AMFIND2(JRN,INST,.NJRN,.NINST,TYPE,profondeur,NBKEY,@GG@(1),@GG@(2),@GG@(3),@GG@(4),@GG@(5),@GG@(6))
 K @(GG)
 Q RES
 
 
 
 
GET(GG,TYPE,TITRE) 
 N %C,%R,PK,X,Y,GLO,I,STO,VAL,VALDEF,STOCK,SOR
 D CURON^%VVIDEO
 S STO="STOCK",VAL="VALDEF"
 S GLO=$$TEMP^%SGUTIL
 S NBC=(NBKEY*2)-1
 D INIT
 W /WOPEN(10,4,58,(NBKEY*2)+3,"","","","","tc"),/COLOR(0,7),/CLR
 
 F I=1:1:NBC S VALDEF(I)=""
 S VALDEF="STOCK"
DEF 
 D ^%PKSAISI(0,0,1,0,1,GLO,VAL,.ERR)
 
 D CUROF^%VVIDEO
 W /WCLOSE
 I '($D(STOCK)) Q 0
 F I=1:1:NBKEY S @GG@(I)=$P(STOCK,$C(0),(2*I)-1)
 K STOCK,@(GLO)
 Q 1
 
INIT 
 N I,J,OBLIG,TJSOK,PLL
 
 
 
 
 
 
 
 S @GLO@("FL")="LDR"
 
 S @GLO=TITRE
 
 S @GLO@("H")=2,@GLO@("V")=2
 
 S @GLO@("NBC")=NBC
 
 F I=1:1:NBKEY S @GLO@("CHAMPS",(2*I)-1)=^%RQSGLO("EXPLIC",@MOTEUR,"OBJET",TYPE,"DESCRIPTEUR",I),@GLO@("CHAMPS",2*I)=" "
 K @GLO@("CHAMPS",I*2)
 
 S PLL=0 F I=1:1:NBC I $L(@GLO@("CHAMPS",I))>PLL S PLL=$L(@GLO@("CHAMPS",I))
 S @GLO@("PLL")=PLL
 
 S @GLO@("L")=50-PLL F I=1:1:NBC S @GLO@("LARG",I)=50-PLL
 
 F I=1:1:NBKEY S @GLO@("SUIV",(2*I)-1)=(2*I)+1,@GLO@("PREC",(2*I)+1)=(2*I)-1
 S @GLO@("SUIV",(2*I)-1)=1,@GLO@("PREC",1)=(2*I)-1
SUITE 
 
 S @GLO@("POP1")="",@GLO@("POP2")=""
 
 
 
 
 
 
 
 S TJSOK="S OK=1"
 
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

