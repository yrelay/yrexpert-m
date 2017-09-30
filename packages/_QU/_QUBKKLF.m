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

;%QUBKKLF^INT^1^59547,73884^0
%QUBKKLF ;;04:35 PM  21 Feb 1992;
 
 
 N RES,NBFEN,NEWLG,IFEN
 S NEWLG=$$TEMP^%SGUTIL
 S NBFEN=@TEMP@("VNBFEN")
 S RES=$$NEWLARG
 Q:RES=""
 F IFEN=1:1:NBFEN S @NEWLG@(IFEN)=$P(RES,$C(0),(IFEN*2)-1),$P(@GLODEF@("F",IFEN),"^")=@NEWLG@(IFEN),@GL@("FEN",IFEN,"L")=@NEWLG@(IFEN)
 D MODLG^%QUBKVA(@TEMP@("NUMSTRU"),NEWLG)
 Q
 
 
NEWFEN N LSTCOL,VUE
 S DEBFEN(IFEN)=AC
 S AC=(AC+LARG(IFEN))+1
 S COLG(IFEN)=@IN@("FEN",IFEN,"D"),LAR=0
 S VUE=0
 F LSTCOL=COLG(IFEN):1 S LAR=LAR+@IN@("LI",LSTCOL,"L"),VUE=LAR>LARG(IFEN) Q:VUE  Q:LSTCOL=@IN@("FEN",IFEN,"F")
 S COLD(IFEN)=LSTCOL-VUE
 Q
 
 
NEWLARG() 
 N %C,%R,PK,X,Y,GLO,I,STO,VAL,STOCK,TEMP
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"R") K @(TEMP)
 S GLO=$$CONCAS^%QZCHAD(TEMP,"G")
 S VAL=$$CONCAS^%QZCHAD(TEMP,"V")
 D CLEPAG^%VVIDEO
 D INIT
 
 S @VAL="STOCK"
 F I=2:1:NBFEN S @VAL@((I-1)*2)="",@VAL@((I*2)-1)=$P(@GLODEF@("F",I),"^")
 S @VAL@(1)=$P(@GLODEF@("F",1),"^")
 
 D ^%PKSAISI(1,0,1,0,1,GLO,VAL,.ERR)
 
 Q:'($D(STOCK)) ""
 Q STOCK
 
INIT 
 N NBC,I,J,OBLIG,TJSOK,PLL
 
 S NBC=(NBFEN*2)-1
 
 
 S @GLO@("FL")="LD"
 
 S @GLO="largeurs"
 
 S @GLO@("H")=3,@GLO@("V")=3
 
 S @GLO@("NBC")=NBC
 
 S PLL=0
 F I=1:1:NBFEN S (@GLO@("CHAMPS",(2*I)-1),J)="fenetre "_I S:$L(J)>PLL PLL=$L(J)
 F I=2:2:NBC-1 S @GLO@("CHAMPS",I)=" "
 
 S @GLO@("PLL")=PLL
 
 S @GLO@("L")=10 F I=1:1:NBC S @GLO@("LARG",I)=10
 
 F I=3:2:NBC S @GLO@("SUIV",I-2)=I,@GLO@("PREC",I)=I-2
 S @GLO@("SUIV",NBC)=1,@GLO@("PREC",1)=NBC
 
 S @GLO@("POP1")="",@GLO@("POP2")=""
 
 
 
 
 
 S TJSOK="S OK=1"
 
 S @GLO@("STO.DER")=1
 
 S @GLO@("BOU.AJOUT")=0,@GLO@("BOU.ERREUR")=1
 
 
 S @GLO@("EXEC.UCONT")="C"
 F I=1:1:NBC S @GLO@("UCONT.CHAMPS",I)=""
 
 
 
 S OBLIG="S OK=(VAL'="""")"
 F I=1:1:NBC S @GLO@("OBLIGAT",I)=TJSOK
 F I=1:2:NBC S @GLO@("OBLIGAT",I)=OBLIG
 
 F I=1:1:NBC S @GLO@("FORMAT",I)=TJSOK
 
 F I=1:1:NBC S @GLO@("VALEG",I,0)="S OK=1"
 Q
 ;

