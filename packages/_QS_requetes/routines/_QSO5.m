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

;%QSO5^INT^1^59547,73883^0
QSO5(BASE,STRUCT,OBJET,RESUL) 
 
 
 
 
 
 
 
 
 
 N O,I,PILE,INTERD,TEMP,INT
 S DX=0,DY=23 X XY
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S PILE=$$CONCAS^%QZCHAD(TEMP,"PILE")
 S INTERD=$$CONCAS^%QZCHAD(TEMP,"INTERD")
 D INITFI^%QCASTA(PILE)
 D PUSH^%QCASTA(PILE,OBJET_"^@")
 F I=0:0 Q:$$PILEVIDE^%QCASTA(PILE)  S O=$$POP^%QCASTA(PILE),INT=$P(O,"^",2),O=$P(O,"^",1) I $D(@INTERD@(O))=0 D CHEM(INT,O,STRUCT,RESUL),INCR S @INTERD@(O)=""
 K @(TEMP)
 Q ""
 
INCR W "." Q
 
CHEM(INT,IND,STRUCT,RESUL) 
 N ATT,ATTI,I,J,OR,ERR,BASED,NOMF,LATT,TY,OR1,K,INTD
 N BASEDL,BASEL,BL,ATTD,BDL,BASE,VAL,TYPE
 S VAL=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"VAL")
 S BASE=@STRUCT@(INT,"BASE")
 S BL=$$NOMLOG^%QSF(BASE)
 S INTD=$O(@STRUCT@(INT,"DESTINATION",""))
 F I=0:0 Q:INTD=""  D T2 S INTD=$O(@STRUCT@(INT,"DESTINATION",INTD))
 D MV(BASE,IND,RESUL,STRUCT,INT)
 Q
T2 S ATT=@STRUCT@(INTD,"REP")
 K @(VAL)
 D MVG^%QSCALVA(BASE,IND,ATT,VAL,.TYPE)
 I @VAL=0 Q
 I TYPE=0 Q
 S BASEL=$$NOMINT^%QSF(ATT)
 I TYPE=1 G T5P
 I TYPE=2 G T5F
 I TYPE=3 G T5R
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
T4P D PUSH^%QCASTA(PILE,@VAL@(OR)_"^"_INTD)
 Q
T4F D PUSH^%QCASTA(PILE,$$NOMFILS^%QSGES10(BASE,IND,BASEL,@VAL@(OR))_"^"_INTD)
 Q
T4R D PUSH^%QCASTA(PILE,@VAL@(OR)_"^"_INTD)
 Q
 
MV(BASE,IND,RESUL,STRUCT,INT) 
 N I,ATT,J,OR,RANG,VAL,TYPE
 S VAL=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"VALMV")
 S ATT=$O(@STRUCT@(INT,"ATT",""))
 F I=0:0 Q:ATT=""  D MV1 S ATT=$O(@STRUCT@(INT,"ATT",ATT))
 K @(VAL)
 Q
MV1 K @(VAL)
 D MVG^%QSCALVA(BASE,IND,ATT,VAL,.TYPE)
 S OR=$O(@VAL@("")),RANG=$ZP(@RESUL@(INT,ATT,""))+0
 F J=1:1 Q:OR=""  S @RESUL@(INT,ATT,RANG+J)=OR_"^"_@VAL@(OR),OR=$O(@VAL@(OR))
 Q

