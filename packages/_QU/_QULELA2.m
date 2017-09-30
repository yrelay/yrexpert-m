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
;! Nomprog     : %QULELA2(VALDEF)                                             !
;! Module      : EDITEUR DE LIEN                                              !
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

%QULELA2(VALDEF) ;
 
 
 
 
 
 N %C,%R,PK,X,Y,GLO,I,STO,VAL,STOCK,GREM
 S VAL=$$TEMP^%SGUTIL
 S GREM="^[QUI]RQSDON(""REM"",""QULEL2"",""VALGRIL"")"
 S GLO=$$TEMP^%SGUTIL
 
 D CLEPAG^%VVIDEO
 D:'($D(@GLO)) INIT
 S @VAL="STOCK"
 
 F I=2:2:6 S @VAL@(I)=""
 F I=1:1:4 S @VAL@((I*2)-1)=$P(VALDEF,$C(0),I)
 F I=1:1:7 I @VAL@(I)="",$D(@GREM@(I)) S @VAL@(I)=@GREM@(I)
 I @VAL@(7)="" S @VAL@(7)="STANDARD"
 
 D ^%PKSAISI(1,0,1,0,1,GLO,VAL,.ERR)
 
 Q:'($D(STOCK)) ""
 F I=1:1:7 S @GREM@(I)=$P(STOCK,$C(0),I)
 K @(VAL)
 Q STOCK
 
 
INIT 
 N NBC,I,J,OBLIG,TJSOK,PLL
 
 S NBC=7
 
 
 
 
 
 S @GLO@("FL")="LD"
 
 S @GLO="definition de l'etude"
 
 S @GLO@("H")=3,@GLO@("V")=3
 
 S @GLO@("NBC")=NBC
 
 S J=1,PLL=0 F I="Repertoire","Liste des liens","Racine","Configuration" S @GLO@("CHAMPS",J)=I,J=J+2 S:$L(I)>PLL PLL=$L(I)
 F I=2:2:NBC-1 S @GLO@("CHAMPS",I)=" "
 
 S @GLO@("PLL")=PLL
 
 S @GLO@("L")=40 F I=1:1:NBC S @GLO@("LARG",I)=40
 
 F I=3:2:NBC S @GLO@("SUIV",I-2)=I,@GLO@("PREC",I)=I-2
 S @GLO@("SUIV",NBC)=1,@GLO@("PREC",1)=NBC
 
 S @GLO@("POP1")="",@GLO@("POP2")=""
 
 S @GLO@("AIDE",1)=$$^%QZCHW("Nom du repertoire auquel")_$C(0)_$$^%QZCHW("les racines appartiennent")
 S @GLO@("AIDE",3)=$$^%QZCHW("Liste des attributs lien a parcourir")_$C(0)_$$^%QZCHW(" (ou nom d'un lien)")
 S @GLO@("AIDE",5)=$$^%QZCHW("Nom d'un individu du repertoire")_$C(0)_$$^%QZCHW(" ou d'une liste d'individus")_$C(0)_$$^%QZCHW(" ou * pour tout le repertoire")
 S @GLO@("AIDE",5)=@GLO@("AIDE",5)_$C(0)_$$^%QZCHW(" (? pour choix d'un individu,")_$C(0)_$$^%QZCHW("  ?? pour choix d'une liste)")
 
 
 
 ;HL S TJSOK=$ZXECUTE("S OK=1")
 S TJSOK="S OK=1"
 
 
 S @GLO@("STO.DER")=1
 
 S @GLO@("BOU.AJOUT")=0,@GLO@("BOU.ERREUR")=1
 
 
 S @GLO@("EXEC.UCONT")="C"
 F I=1:1:NBC S @GLO@("UCONT.CHAMPS",I)=""
 S @GLO@("UCONT.CHAMPS",1)="D OKREP^%QULELAU"
 S @GLO@("UCONT.CHAMPS",3)="D OKLIEN^%QULELAU"
 S @GLO@("UCONT.CHAMPS",5)="D OKINDI^%QULELAU"
 S @GLO@("UCONT.CHAMPS",7)="D OKCONF^%QULELAU"
 S @GLO@("UCONT")="D OKGRIL^%QULELA2"
 
 S OBLIG="S OK=(VAL'="""")"
 F I=1:1:NBC S @GLO@("OBLIGAT",I)=TJSOK
 F I=1,3,5,7 S @GLO@("OBLIGAT",I)=OBLIG
 
 F I=1:1:NBC S @GLO@("FORMAT",I)=TJSOK
 
 F I=1:1:NBC S @GLO@("VALEG",I,0)="S OK=1"
 Q
 
 
OKGRIL S OK=(((VAL(1)'="")&(VAL(3)'=""))&(VAL(5)'=""))&(VAL(7)'="") Q

