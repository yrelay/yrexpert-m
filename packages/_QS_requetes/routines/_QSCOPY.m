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

;%QSCOPY^INT^1^59547,73881^0
QSCOPY(LISTE,BASE,STRUCT) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N O,I,PILE,STRUCT1,INTERD,TEMP
 S DX=0,DY=23 X XY
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S PILE=$$CONCAS^%QZCHAD(TEMP,"PILE")
 S INTERD=$$CONCAS^%QZCHAD(TEMP,"INTERD")
 S STRUCT1=$$CONCAS^%QZCHAD(STRUCT,"S")
 D INITFI^%QCASTA(PILE)
 S O=$O(@LISTE@(""))
 F I=0:0 Q:O=""  D T1 S O=$O(@LISTE@(O))
 F I=0:0 Q:$$PILEVIDE^%QCASTA(PILE)  S O=$$POP^%QCASTA(PILE),BASE=$P(O,"^",2),O=$P(O,"^",1) I $D(@INTERD@(O))=0 D COPY(BASE,O,STRUCT1),INCR S @INTERD@(O)=""
 K @(TEMP)
 Q
 
T1 D PUSH^%QCASTA(PILE,O_"^"_BASE) Q
INCR W "." Q
 
COPY(BASE,IND,STRUCT) 
 
 N ATT,ATTI,I,J,OR,ERR,BASED,NOMF,LATT,TOUS,TY,OR1,K
 N BASEDL,BASEL,BL,ATTD,BDL,VAL,VA,TYPE
 S VAL=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"VAL"),VA=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"VA")
 S TOUS=$$^%QCAZG($$CONCAS^%QZCHAD(STRUCT,BASE_",TS"))+0
 S BASED=@STRUCT@(BASE,"BDI")
 S BDL=@STRUCT@(BASE,"BD")
 S BL=@STRUCT@(BASE,"LO")
 I TOUS S LATT=$$LISTATT1^%QSGEST6(BASE,IND) D TOUS
 I '(TOUS) S LATT=$$^%QCAZG($$CONCAS^%QZCHAD(STRUCT,BASE_",LI")) D:LATT'="" QQ
 S ATT=$O(@STRUCT@(BASE,"R",""))
 F I=0:0 Q:ATT=""  D T2 S ATT=$O(@STRUCT@(BASE,"R",ATT))
 K @(VAL),@(VA) Q
 
TOUS S ATT=$O(@LATT@(""))
 F I=0:0 Q:ATT=""  D TO1 S ATT=$O(@LATT@(ATT))
 Q
 
QQ S ATTI=$O(@LATT@(""))
 F I=0:0 Q:ATTI=""  S ATT=@LATT@(ATTI) D TO1 S ATTI=$O(@LATT@(ATTI))
 Q
 
TO1 K @(VAL)
 D MVG^%QSCALVA(BASE,IND,ATT,VAL,.TYPE)
 Q:TYPE'=0
 S OR=$O(@VAL@(""))
 F J=0:0 Q:OR=""  D PA^%QSGESTI(BASED,IND,ATT,@VAL@(OR),OR) S OR=$O(@VAL@(OR))
 K @(VAL) Q
 
T2 K @(VAL)
 D MVG^%QSCALVA(BASE,IND,ATT,VAL,.TYPE)
 I @VAL=0 Q
 I TYPE=0 Q
 S BASEL=@STRUCT@(BASE,"R",ATT)
 S BASEDL=@STRUCT@(BASEL,"BDI")
 S ATTD=@STRUCT@(BASEL,"BD")
 S ATTINV=$$LIENI^%QSGEL2(BASE,BASEL,ATT,TYPE)
 I TYPE=1 G T5P
 I TYPE=2 G T5F
 I ((TYPE=3)!(TYPE=4))!(TYPE=5) G T5R
 Q
T5P S OR=$O(@VAL@(""))
 F J=0:0 Q:OR=""  D T4P S OR=$O(@VAL@(OR))
 Q
T5F S OR=$O(@VAL@(""))
 F J=0:0 Q:OR=""  D T4F S OR=$O(@VAL@(OR))
 Q
T5R S OR=$O(@VAL@(""))
 F J=0:0 Q:OR=""  D T4R S OR=$O(@VAL@(OR))
 Q
T4P N TY K @(VA)
 D PUSH^%QCASTA(PILE,@VAL@(OR)_"^"_BASEL)
 D MVG^%QSCALVA(BASEL,@VAL@(OR),ATTINV,VA,.TY)
 S NOMF=$$NOMEX^%QSGES10(BASED,IND)
 S OR1=$O(@VA@(""))
 F K=0:0 Q:OR1=""  Q:@VA@(OR1)=NOMF  S OR1=$O(@VA@(OR1))
 I OR1="" S OR1=$ZP(@VA@(""))+1
 D ADDO^%QSGEST3(BASEDL,@VAL@(OR),OR1,ATTINV,BASED,NOMF)
 Q
T4F D PUSH^%QCASTA(PILE,$$NOMFILS^%QSGES10(BASE,IND,BASEL,@VAL@(OR))_"^"_BASEL)
 D ADDO^%QSGEST3(BASED,IND,OR,ATT,BASEDL,@VAL@(OR))
 Q
T4R D PUSH^%QCASTA(PILE,@VAL@(OR)_"^"_BASEL)
 D ADDS^%QSGEST3(BASED,IND,ATT,BASEDL,@VAL@(OR))
 Q
 
TEST D ^%QSCOPY("^[QUI]RQS2(""RQS87120012"",""OBJET"")","P0","^DAT")
 Q
 
DEL N I,J
 F I=1,2,3,4 F J="LOT","GAMME.LOT","OPERATION.LOT" S A="^[QUI]QUERY"_I_"("""_J_""")" W !,A K @(A) S:I=1 @A=0
 Q

