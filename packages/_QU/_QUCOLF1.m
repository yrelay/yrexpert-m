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

;%QUCOLF1^INT^1^59547,73884^0
ZCOLFEN2 ;
UC() Q:'($D(@DONNE@(PL,PC,"PROTECT"))) 1
 I @DONNE@(PL,PC,"PROTECT") D ^%VSQUEAK Q 0
 Q 1
CR 
 N NEW,OLD,OK,RM S RM=LE
 S OLD=$S($D(@DONNE@(PL,PC)):@DONNE@(PL,PC),1:"")
 S DX=PX,DY=PY X XY W $C(X1)
 S YG=$C(X1),PCX=PX,PCY=PY D BEG^%VLEC I CTRLA!(Y1="") D AFF(OLD) Q
 D AFF(Y1) S NEW=Y1,OK=1
 I $D(@COLON@(PC,"UC")) S @("OK=$$"_@COLON@(PC,"UC")_"("""_OLD_""","""_NEW_""","_PC_","_PL_")")
 I '(OK) D AFF(OLD),^%VSQUEAK Q
 D OK(OLD,NEW) Q
OK(OLD,NEW) S @DONNE@(PL,PC)=NEW D FULL^%QUCOLF
 D:$D(@COLON@(PC,"TRT")) @(@COLON@(PC,"TRT")_"("""_OLD_""","""_NEW_""","_PC_","_PL_")")
 Q
MD 
 N CTR,NEW,OLD,OLDPC,OLDPL,OK,RM,TAB,YG,Y1 S RM=LE
 S OLD=$S($D(@DONNE@(PL,PC)):@DONNE@(PL,PC),1:"")
 S DX=PX,DY=PY X XY S OLDPC=PC,OLDPL=PL
 S TAB("DX")=XG+2,TAB("DY")=(YH+HA)-1,TAB("MSG")=" Insertion "
 S TAB("PCX")=DX,TAB("PCY")=DY,TAB("%LGX")=DX-1,TAB("%LGD")=DX+POSIT(PC)
 S CTRLA=0,YG=OLD O 0 D MODIF^%VLECFLD(YG,"TAB",.CTR,.Y1)
 S PC=OLDPC,PL=OLDPL I CTR="A" D AFF(OLD) Q
 D AFF(Y1) S NEW=Y1,OK=1
 I $D(@COLON@(PC,"UC")) S @("OK=$$"_@COLON@(PC,"UC")_"("""_OLD_""","""_NEW_""","_PC_","_PL_")")
 I '(OK) D AFF(OLD),^%VSQUEAK Q
 D OK(OLD,NEW) Q
NET O $I S DX=PX,DY=PY X XY W $J("",LARG(PC)) Q
AFF(M) D NET S DX=PX,DY=PY X XY W M Q
IMPR D EFFACE S DX=XG+2,DY=(YH+HA)-1 X XY W $$^%QZCHW("Impression en cours...")
 N C,IMP,L S IMP=$S($D(^[QUI]TABIDENT(WHOIS,"PRINTER")):^[QUI]TABIDENT(WHOIS,"PRINTER"),1:0) O IMP U IMP I IMP'=0 W #
 D TITR,COL C IMP D EFFACE Q
TITR W ! S DX=0
 F C=COLDEP:1 D TTIT Q:'($D(@COLON@(C+1)))
 W !,! S COLFIN=C Q
TTIT S CH=@COLON@(C),LC=$P(CH,"^",3) W ?DX,$P(CH,"^",1) S DX=(DX+LC)+1 Q
COL F L=LIGDEP:1 Q:L>@DONNE  D TLIG
 Q
TLIG S DX=0 W ! F C=COLDEP:1:COLFIN D TCOL
 Q
TCOL S LARG=$P(@COLON@(C),"^",3) W ?DX,$E(@DONNE@(L,C),1,LARG) S DX=(DX+LARG)+1 Q
EFFACE S DX=XG+2,DY=(YH+HA)-1 X XY D ^%VCRIFLD($J("",(DX+LA)-4),DX,DY,DX,(DX+LA)-4) Q

