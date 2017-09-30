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

;%QSCOPN^INT^1^59547,73881^0
QSCOPN(LISTE,BASE,STRUCT) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N O,I,PILE,STRUCT1,INTERD,TEMP
 S DX=0,DY=23 X XY
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S PILE=$$CONCAS^%QZCHAD(TEMP,"PILE")
 S INTERD=$$CONCAS^%QZCHAD(TEMP,"INTERD")
 S STRUCT1=$$CONCAS^%QZCHAD(STRUCT,"S")
 D INITFI^%QCASTA(PILE)
 S O=$O(@LISTE@(""))
 F I=0:0 Q:O=""  D T1 S O=$O(@LISTE@(O))
 K @(TEMP)
 Q
T1 D PUSH^%QCASTA(PILE,O_"^"_BASE)
 F I=0:0 Q:$$PILEVIDE^%QCASTA(PILE)  S IND=$$POP^%QCASTA(PILE),BASE=$P(IND,"^",2),IND=$P(IND,"^",1) I $D(@INTERD@(IND))=0 D COPY(BASE,IND,O,$$TETE2(O),STRUCT1),INCR S @INTERD@(IND)=""
 Q
 
INCR W "." Q
 
COPY(BASE,IND,TETE1,TETE2,STRUCT) 
 
 N ATT,ATTI,I,J,OR,ERR,BASED,NOMF,LATT,TOUS,TY,OR1,K,NOM,NOMEX
 N BASEDL,BASEL,BL,ATTD,BDL,VAL,TYP
 S VAL=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"VAL")
 S TOUS=1
 I ($D(@STRUCT@(BASE,"TS"))#10)=1 S TOUS=@STRUCT@(BASE,"TS")
 S BASED=$$^%QCAZG($$CONCAS^%QZCHAD(STRUCT,BASE_",BDI"))
 
 S BDL=$$^%QCAZG($$CONCAS^%QZCHAD(STRUCT,BASE_",BD"))
 
 S BL=@STRUCT@(BASE,"LO")
 
 I BDL="" S BDL=BL
 
 I BASED="" S BASED=BASE
 
 S NOM=$$NOM(TETE1,TETE2,IND)
 S NOMEX=$$NOMEX^%QSGES10(BASED,NOM)
 I (NOM=IND)&(BASE=BASED) Q
 I TOUS S LATT=$$LISTATT1^%QSGEST6(BASE,IND) D TOUS
 I '(TOUS) S LATT=$$^%QCAZG($$CONCAS^%QZCHAD(STRUCT,BSE_",LI")) D:LATT'="" QQ
 S ATT=$O(@STRUCT@(BASE,"R",""))
 F I=0:0 Q:ATT=""  D T2 S ATT=$O(@STRUCT@(BASE,"R",ATT))
 K @(VAL) Q
TOUS S ATT=$O(@LATT@(""))
 F I=0:0 Q:ATT=""  D TO1 S ATT=$O(@LATT@(ATT))
 D PA^%QSGESTI(BASED,NOM,"NOM",NOMEX,1)
 Q
QQ S ATTI=$O(@LATT@(""))
 F I=0:0 Q:ATTI=""  S ATT=@LATT@(ATTI) D TO1 S ATTI=$O(@LATT@(ATTI))
 D PA^%QSGESTI(BASED,NOM,"NOM",NOMEX,1)
 Q
TO1 K @(VAL)
 D MVG^%QSCALVA(BASE,IND,ATT,VAL,.TYPE)
 Q:TYPE'=0
 S OR=$O(@VAL@(""))
 F J=0:0 Q:OR=""  D PA^%QSGESTI(BASED,NOM,ATT,@VAL@(OR),OR) S OR=$O(@VAL@(OR))
 K @(VAL) Q
T2 K @(VAL)
 D MVG^%QSCALVA(BASE,IND,ATT,VAL,.TYPE)
 I @VAL=0 Q
 I TYPE=0 Q
 S BASEL=@STRUCT@(BASE,"R",ATT)
 S BASEDL=$$^%QCAZG($$CONCAS^%QZCHAD(STRUCT,BASEL_",BDI"))
 S ATTD=$$^%QCAZG($$CONCAS^%QZCHAD(STRUCT,BASEL_",BD"))
 I BASEDL="" S BASEDL=BASEL
 I ATTD="" S ATTD=ATT
 
 
 
 I TYPE=2 D T5F Q
 Q
T5F S OR=$O(@VAL@(""))
 F J=0:0 Q:OR=""  D T4F S OR=$O(@VAL@(OR))
 Q
T4F D PUSH^%QCASTA(PILE,$$NOMFILS^%QSGES10(BASE,IND,BASEL,@VAL@(OR))_"^"_BASEL)
 D ADDO^%QSGEST3(BASED,NOM,OR,ATTD,BASEDL,@VAL@(OR))
 Q
 
NOM(TETE1,TETE2,IND) Q TETE2_$P(IND,TETE1,2,1000)
TETE2(TETE1) N A S A=@LISTE@(TETE1) Q:A="" TETE1 Q A
 
 
TEST N LI,LI1
 S STRUCT=$$CONCAS^%QZCHAD("^RQSMOD7","ALPAGE,TR,AL")
 S STRUCTD=$$CONCAS^%QZCHAD("^RQSMOD7","ALPAGE,MI,LOT")
 S LI("ARC21")="ARC221"
 S LI1("ARC221")=""
 D ^%QSCPK("LI1","LOT",STRUCTD)
 D ^%QSCOPN("LI","P0",STRUCT)
 Q
 
TEST1 N LI,LI1
 S STRUCTD=$$CONCAS^%QZCHAD("^RQSMOD7","ALPAGE,MI,LOT")
 S STRUCT=STRUCTD
 S LI("ARC221")="ARC223"
 S LI1("ARC223")=""
 D ^%QSCPK("LI1","LOT",STRUCTD)
 D ^%QSCOPN("LI","LOT",STRUCT)
 Q

