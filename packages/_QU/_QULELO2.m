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
;! Nomprog     : %QULELO2                                                     !
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
;! HL002 ! HL     ! 09/09/15 ! %GTM-E-FMLLSTMISSING, The formal list is absent!
;!       !        !          ! from a label called with an actual list:       !
;! HL003 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!
 
%QULELO2(VALDEF) ;
 
 N %C,%R,PK,X,Y,GLO,I,STO,VAL,STOCK
 N TEMP
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"R") K @(TEMP)
 S GLO=$$CONCAS^%QZCHAD(TEMP,"G")
 S VAL=$$CONCAS^%QZCHAD(TEMP,"V")
 D CLEPAG^%VVIDEO
 D:'($D(@GLO)) INIT
 
 S @VAL="STOCK"
 F I=2:2:14 S @VAL@(I)=""
 F I=1:1:8 S @VAL@((I*2)-1)=$P(VALDEF,$C(0),I)
 D REMAN
 
 ;HL002 D ^%PKSAISI(1,0,1,0,1,GLO,VAL,.ERR)
 D PKSAISI^%PKSAISI(1,0,1,0,1,GLO,VAL,.ERR)
 
 Q:'($D(STOCK)) ""
 D SETR(STOCK)
 Q STOCK
 
REMAN N GREM,R
 S GREM="^[QUI]RQSDON(""QULEL"",""R"")"
 I @VAL@(1)="" S @VAL@(7)="STANDARD" Q
 I @VAL@(3)="" S @VAL@(7)="STANDARD" Q
 I @VAL@(5)'="",$D(@GREM@("T",@VAL@(1),@VAL@(3),@VAL@(5))) S R=@GREM@("T",@VAL@(1),@VAL@(3),@VAL@(5)) F I=7,9,11,13,15 S:@VAL@(I)="" @VAL@(I)=$P(R,$C(0),I)
 I '($D(@GREM@("C",@VAL@(1),@VAL@(3)))) S:@VAL@(7)="" @VAL@(7)="STANDARD" Q
 S R=@GREM@("C",@VAL@(1),@VAL@(3)) F I=7,9,11,13,15 S:@VAL@(I)="" @VAL@(I)=$P(R,$C(0),I)
 Q
SETR(R) N GREM
 S GREM="^[QUI]RQSDON(""QULEL"",""R"")"
 S @GREM@("T",$P(R,$C(0)),$P(R,$C(0),3),$P(R,$C(0),5))=R
 S @GREM@("C",$P(R,$C(0)),$P(R,$C(0),3))=R
 Q
INIT 
 N NBC,I,J,OBLIG,TJSOK,PLL
 
 S NBC=15
 
 
 
 
 
 
 S @GLO@("FL")="LD"
 
 S @GLO="definition de l'etude"
 
 S @GLO@("H")=3,@GLO@("V")=3
 
 S @GLO@("NBC")=NBC
 
 S J=1,PLL=0 F I="Repertoire","Lien","Racine","Configuration","Dialogue sur individu","Dialogue sur individu (2)","Dialogue sur lien","Dialogue sur lien (2)" S @GLO@("CHAMPS",J)=I,J=J+2 S:$L(I)>PLL PLL=$L(I)
 F I=2:2:NBC-1 S @GLO@("CHAMPS",I)=" "
 
 S @GLO@("PLL")=PLL
 
 S @GLO@("L")=40 F I=1:1:NBC S @GLO@("LARG",I)=40
 
 F I=3:2:NBC S @GLO@("SUIV",I-2)=I,@GLO@("PREC",I)=I-2
 S @GLO@("SUIV",NBC)=1,@GLO@("PREC",1)=NBC
 
 
 
 S @GLO@("POP1")="",@GLO@("POP2")=""
 
 S @GLO@("AIDE",1)=$$^%QZCHW("Nom du repertoire auquel")_$C(0)_$$^%QZCHW("les racines appartiennent")
 S @GLO@("AIDE",3)=$$^%QZCHW("Nom du lien a parcourir")
 S @GLO@("AIDE",5)=$$^%QZCHW("Nom d'un individu du repertoire")_$C(0)_$$^%QZCHW(" ou d'une liste d'individus")_$C(0)_$$^%QZCHW(" ou * pour tout le repertoire")_$C(0)_$$^%QZCHW(" (? pour choix d'un individu,")_$C(0)_$$^%QZCHW("  ?? pour choix d'une liste)")
 
 
 
 ;HL S TJSOK=$ZXECUTE("S OK=1")
 S TJSOK="S OK=1" X TJSOK
 
 S @GLO@("STO.DER")=1
 
 S @GLO@("BOU.AJOUT")=0,@GLO@("BOU.ERREUR")=1
 
 
 
 S @GLO@("EXEC.UCONT")="C"
 F I=1:1:NBC S @GLO@("UCONT.CHAMPS",I)=""
 S @GLO@("UCONT.CHAMPS",1)="D OKREP^%QULELOU"
 S @GLO@("UCONT.CHAMPS",3)="D OKLIEN^%QULELOU"
 S @GLO@("UCONT.CHAMPS",5)="D OKINDI^%QULELOU"
 S @GLO@("UCONT.CHAMPS",7)="D OKCONF^%QULELOU"
 F I=9,11,13,15 S @GLO@("UCONT.CHAMPS",I)="D OKDIA^%QULELOU"
 S @GLO@("UCONT")="D OKGRIL^%QULELO2"
 
 S @GLO@("AIDE",1)=$$^%QZCHW("Nom du repertoire auquel")_$C(0)_$$^%QZCHW("les racines appartiennent")
 S @GLO@("AIDE",3)=$$^%QZCHW("Nom du lien a parcourir")
 S @GLO@("AIDE",5)=$$^%QZCHW("Nom d'un individu du repertoire")_$C(0)_$$^%QZCHW(" ou d'une liste d'individus")_$C(0)_$$^%QZCHW(" ou * pour tout le repertoire")_$C(0)_$$^%QZCHW(" (? pour choix d'un individu,")_$C(0)_$$^%QZCHW("  ?? pour choix d'une liste)")
 
 
 S OBLIG="S OK=(VAL'="""")"
 F I=1:1:NBC S @GLO@("OBLIGAT",I)=TJSOK
 F I=1,3,5,7 S @GLO@("OBLIGAT",I)=OBLIG
 
 
 F I=1:1:NBC S @GLO@("FORMAT",I)=TJSOK
 
 F I=1:1:NBC S @GLO@("VALEG",I,0)="S OK=1"
 Q
 
 
 
 
 
OKGRIL S OK=(((VAL(1)'="")&(VAL(3)'=""))&(VAL(5)'=""))&(VAL(7)'="") Q

