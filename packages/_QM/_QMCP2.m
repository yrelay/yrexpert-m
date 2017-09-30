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

;%QMCP2^INT^1^59547,73876^0
QMCP2 ;
 
 
 
 
 
 
 
 
COPY(PILE,WHOIS1,QUI1,BASE1,IND1,COOR,STRUCT,WHOIS2,QUI2,MODE) 
 N ATT,ATTI,I,J,OR,ERR,BASE2,LATT,TOUS,TY,K,IND2,NOMEX2,BASE2L,BASE1L,LIEN1,LIEN2,TEMP,VA,VAL,AA,MSG
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"COPY") K @(TEMP)
 S VA=$$CONCAS^%QZCHAD(TEMP,"VA")
 S VAL=$$CONCAS^%QZCHAD(TEMP,"VAL")
 S TOUS=1
 I ($D(@STRUCT@("S",BASE1,"TS"))#10)=1 S TOUS=@STRUCT@("S",BASE1,"TS")
 
 S BASE2=$S(($D(@STRUCT@("S",BASE1,"BDI"))#10)=1:@STRUCT@("S",BASE1,"BDI"),1:"")
 
 I BASE2="" S BASE2=BASE1
 
 
 
 S IND2=""
 I MODE S IND2=$$NOM(COOR,BASE1,IND1)
 
 I MODE S NOMEX2=$$NOMEX^%QMCPZ(WHOIS2,QUI2,BASE2,IND2)
 
 I MODE=1,((QUI1=QUI2)&(IND2=IND1))&(BASE1=BASE2) K @(TEMP) Q
 
 I BASE1=$$ONE^%QSGEL3("LISTE"),(MODE=1)!(MODE=3) D COPY^%QMCP24(WHOIS1,QUI1,IND1,WHOIS2,QUI2,IND2,"","",MODE) K @(TEMP) Q
 I MODE,TOUS S LATT=$$LISTATT1^%QMCPZ(WHOIS2,QUI1,BASE1,IND1) D TOUS
 I MODE,'(TOUS) S LATT=$S(($D(@STRUCT@("S",BASE1,"LI"))#10)=1:@STRUCT@("S",BASE1,"LI"),1:"") D:LATT'="" QQ
 S LIEN1=$O(@STRUCT@("S",BASE1,"R",""))
 
 F I=0:0 Q:LIEN1=""  D T2 S LIEN1=$O(@STRUCT@("S",BASE1,"R",LIEN1))
 
 D ^%QMCP25(PILE,STRUCT,WHOIS1,QUI1,BASE1,IND1,WHOIS2,QUI2,BASE2,IND2,MODE)
 K @(TEMP)
 Q
TOUS 
 
 
 S AA=$$CRE
 S ATT=$O(@LATT@(""))
 F I=0:0 Q:ATT=""  D TO1^%QMCP21(WHOIS1,QUI1,BASE1,IND1,ATT,WHOIS2,QUI2,BASE2,IND2,MODE) S ATT=$O(@LATT@(ATT))
 Q
QQ 
 
 
 S AA=$$CRE
 S ATTI=$O(@LATT@(""))
 F I=0:0 Q:ATTI=""  S ATT=@LATT@(ATTI) D TO1^%QMCP21(WHOIS1,QUI1,BASE1,IND1,ATT,WHOIS2,QUI2,BASE2,IND2,MODE) S ATTI=$O(@LATT@(ATTI))
 Q
CRE() 
 N %R,RP,RO,LP
 S AA=$$CREER1^%QMCPOZ(QUI,WHOIS2,QUI2,BASE2,IND2,"",1,.MSG,0,MODE)
 Q:AA=1 1 Q:MODE'=1 0
 D PEREFILS^%QMCPZ(WHOIS2,QUI2,BASE2,.RP,.LP)
 
 I RP="" Q 0
 S RO="" F %R=0:0 S RO=$O(@STRUCT@("S",RO)) Q:RO=""  I @STRUCT@("S",RO,"BDI")=RP Q
 Q:RO'="" 0
 
 S AA=$$CREPER^%QMCPZ(WHOIS2,QUI2,BASE2,IND2,"",.MSG)
 Q AA
 
T2 
 N TYPE
 K @(VAL)
 
 I (LIEN1="APPELLE")!(LIEN1="APPELE.PAR"),BASE1=$$ONE^%QSGEL3("TRAITEMENT"),(MODE=1)!(MODE=3) Q
 D MVG^%QMCPZ(WHOIS1,QUI1,BASE1,IND1,LIEN1,VAL,.TYPE)
 I @VAL=0 G FT2
 
 D LIENR^%QMCPZ(WHOIS1,QUI1,LIEN1,BASE1,.BASE1L)
 
 S LIEN2=@STRUCT@("S",BASE1,"R",LIEN1)
 
 D LIENR^%QMCPZ(WHOIS2,QUI2,LIEN2,BASE2,.BASE2L)
 S TYPE=$$TYPE^%QMCPZ(WHOIS2,QUI2,BASE2,LIEN2)
 
 I TYPE=0 G FT2
 I TYPE=1 D T5P G FT2
 I TYPE=2 D T5F G FT2
 I ((TYPE=3)!(TYPE=4))!(TYPE=5) D T5R G FT2
FT2 K @(VAL)
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
 
T4P N TY,NOMPERE,LIEN2I,NOMF,OR1
 
 S LIEN2I=$$LIENI^%QMCPZ(WHOIS2,QUI2,LIEN2)
 K @(VA)
 
 D PUSH^%QCASTA(PILE,@VAL@(OR)_"^"_BASE1L)
 I '(MODE) K @(VA) Q
 
 D MVG^%QMCPZ(WHOIS1,QUI1,BASE1L,@VAL@(OR),LIEN2I,VA,.TY)
 S NOMF=$$NOMEX^%QMCPZ(WHOIS1,QUI1,BASE1,IND1)
 S NOMPERE=$$NOMPERE^%QMCPZ(WHOIS1,QUI1,BASE1,IND1)
 S OR1=$O(@VA@(""))
 F K=0:0 Q:OR1=""  Q:@VA@(OR1)=NOMF  S OR1=$O(@VA@(OR1))
 
 I OR1="" S OR1=$ZP(@VA@(""))+1
 D ADDO^%QMCPOZ(QUI,WHOIS2,QUI2,BASE2L,$$NOM(COOR,BASE1L,NOMPERE),OR1,LIEN2I,BASE2,NOMEX2,MODE)
 K @(VA)
 D QUF^%QMCP23(QUI1,BASE1,IND1,LIEN1,BASE1L,@VAL@(OR),QUI2,BASE2,IND2,LIEN2,BASE2L,$$NOM(COOR,BASE2L,@VAL@(OR)),MODE)
 Q
T4F N IND1L,IND2L
 S IND1L=$$NOMFILS^%QMCPZ(WHOIS1,QUI1,BASE1,IND1,BASE1L,@VAL@(OR))
 D PUSH^%QCASTA(PILE,IND1L_"^"_BASE1L)
 I '(MODE) Q
 S IND2L=$$NOM(COOR,BASE1L,IND1L)
 D ADDO^%QMCPOZ(QUI,WHOIS2,QUI2,BASE2,IND2,OR,LIEN2,BASE2L,$$NOMEX^%QMCPZ(WHOIS2,QUI2,BASE2L,IND2L),MODE)
 D QUF^%QMCP23(QUI1,BASE1,IND1,LIEN1,BASE1L,IND1L,QUI2,BASE2,IND2,LIEN2,BASE2L,IND2L,MODE)
 Q
T4R N IND1L,IND2L
 S IND1L=@VAL@(OR)
 D PUSH^%QCASTA(PILE,IND1L_"^"_BASE1L)
 I '(MODE) Q
 S IND2L=$$NOM(COOR,BASE1L,IND1L)
 D ADDS^%QMCPOZ(QUI,WHOIS2,QUI2,BASE2,IND2,LIEN2,BASE2L,IND2L,MODE)
 D QUF^%QMCP23(QUI1,BASE1,IND1,LIEN1,BASE1L,IND1L,QUI2,BASE2,IND2,LIEN2,BASE2L,IND2L,MODE)
 Q
 
NOM(COOR,BASE1,IND1) 
 I ($D(@COOR@(BASE1,IND1))#10)=1,@COOR@(BASE1,IND1)'="" N %V S %V=@COOR@(BASE1,IND1) Q %V
 Q IND1
 
LIENI(QUI,LIEN) 
 N BASE,BASEL,TYPE
 D LIENR^%QSGEL2(LIEN,.BASE,.BASEL)
 S TYPE=$$TYPEL^%QSGES90(LIEN)
 Q $$LIENI^%QSGEL2(BASE,BASEL,LIEN,TYPE)

