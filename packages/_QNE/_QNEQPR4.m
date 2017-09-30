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

;%QNEQPR4^INT^1^59547,73879^0
QNEQPR4 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
LLISTEN(RETU,ETU,LLISTEN,CATT,ENT,NOMEN,OUT,PORT,TERM) 
 N ADR,I,IPOSTE,POSTE,APOSTE,EXNOMEN,EXOUTIL
 S ADR=$$ADRLT^%QSGEST7(LLISTEN)
 I (ADR=0)!(ADR="") D TRI^%QSGES11(LLISTEN,.ADR)
 S IPOSTE=$O(@ADR@(""))
 F I=0:0 Q:IPOSTE=""  D LL1 S IPOSTE=$O(@ADR@(IPOSTE))
 Q
LL1 N I,OR,IOP,NOP
 S POSTE=@ADR@(IPOSTE)
 S OR="",NOP=10
 S APOSTE=$$ADRLT^%QSGEST7(POSTE)
 I (APOSTE="")!(APOSTE=0) D TRI^%QSGES11(POSTE,.APOSTE)
 
 S IOP=$O(@APOSTE@("")) I IOP="" Q
 
 S EXNOMEN=0,EXOUTIL=0
 D ENTETE^%QNEQPR3(RETU,ETU,NOMEN,0,PORT,TERM)
 D CORPS(RETU,ETU,NOMEN,CATT,IPOSTE,POSTE,ENT,.IOP,.NOP,0,.EXNOMEN,.EXOUTIL,PORT,TERM)
 F I=0:0 Q:IOP=""  D ENTETE^%QNEQPR3(RETU,ETU,NOMEN,0,PORT,TERM),CORPS(RETU,ETU,NOMEN,CATT,IPOSTE,POSTE,ENT,.IOP,.NOP,0,.EXNOMEN,.EXOUTIL,PORT,TERM)
 D CONCL(RETU,ETU,NOMEN,POSTE,PORT,TERM)
 I NOMEN=0 G XX
 I EXNOMEN=0 G XX
 
 S OR="",NOP=10
 S IOP=$O(@APOSTE@("")) I IOP="" Q
 D ENTETE^%QNEQPR3(RETU,ETU,NOMEN,1,PORT,TERM)
 D CORPS(RETU,ETU,NOMEN,CATT,IPOSTE,POSTE,ENT,.IOP,.NOP,1,.EXNOMEN,.EXOUTIL,PORT,TERM)
 F I=0:0 Q:IOP=""  D ENTETE^%QNEQPR3(RETU,ETU,NOMEN,1,PORT,TERM),CORPS(RETU,ETU,NOMEN,CATT,IPOSTE,POSTE,ENT,.IOP,.NOP,1,.EXNOMEN,.EXOUTIL,PORT,TERM)
XX I OUT=0 Q
 I EXOUTIL=0 Q
 
 S OR="",NOP=10
 S IOP=$O(@APOSTE@("")) I IOP="" Q
 D ENTETE^%QNEQPR3(RETU,ETU,NOMEN,2,PORT,TERM)
 D CORPS(RETU,ETU,NOMEN,CATT,IPOSTE,POSTE,ENT,.IOP,.NOP,2,.EXNOMEN,.EXOUTIL,PORT,TERM)
 F I=0:0 Q:IOP=""  D ENTETE^%QNEQPR3(RETU,ETU,NOMEN,2,PORT,TERM),CORPS(RETU,ETU,NOMEN,CATT,IPOSTE,POSTE,ENT,.IOP,.NOP,2,.EXNOMEN,.EXOUTIL,PORT,TERM)
 Q
 
CORPS(RETU,ETU,NOMEN,CATT,IPOSTE,POSTE,ENT,IOP,NOP,TYPO,EXNOMEN,EXOUTIL,PORT,TERM) 
 N H,L,APOSTE,OP,I,LI,B,LIB,COM,TEMP,TYP,TAILLE
 N CO,COR,J,PAS,FLOOR,BESOIN,BB,LBESOIN,LIN,START2,LIENI,FLOOR2
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"CORPS")
 S COM=$$CONCAS^%QZCHAD(TEMP,"COM")
 S BESOIN=$$CONCAS^%QZCHAD(TEMP,"BESOIN")
 K @(TEMP)
 S (H,L)=1
 
 
 S FLOOR=25
 
 S START2=4
 S FLOOR2=25
 
 S PAS=5E-1
 S TAILLE=10
 S LBESOIN="A.BESOIN.DE"
 S LIENI=$$LIENI^%QSGEL3
 D LIENR^%QSGEL2(LBESOIN,.B,.BB)
 S B=$$BASE^%QSGEST7(POSTE)
 D PLACER^%PBPZPR(PORT,TERM,TAILLE,10*L,13E-1*H,$$AFGR^%QFGRACT(POSTE))
 D PLACER^%PBPZPR(PORT,TERM,TAILLE,5E-1*L,8E-1*H,ENT)
 
 S APOSTE=$$ADRLT^%QSGEST7(POSTE)
 I (APOSTE="")!(APOSTE=0) D TRI^%QSGES11(POSTE,.APOSTE)
 S LI=4,LIN=START2
 F I=0:0 Q:IOP=""  Q:LI>FLOOR  Q:LIN>FLOOR2  Q:$$CO1  S IOP=$O(@APOSTE@(IOP)),NOP=NOP+10
 
 I IOP'="" D PLACER^%PBPZPR(PORT,TERM,16,13*L,275E-1*H,$$^%QZCHW("suite a la page suivante"))
 K @(TEMP)
 Q
CO1() S OP=@APOSTE@(IOP)
 S TAILLE=9
 I TYPO=1 G BES
 I TYPO=2 G OU
 
 K @(COM)
 D MVG^%QSCALVA(B,OP,"COMMENTAIRE",COM,.TYP)
 
 
 I (LI+((@COM+1)*PAS))>FLOOR Q 1
 
 D PLACER^%PBPZPR(PORT,TERM,TAILLE,15E-1*L,LI*H,NOP)
 
 S LIB=$$^%QSCALVA(B,OP,"ACTION")_" "_$$^%QSCALVA(B,OP,"OBJET")_" "_$$^%QSCALVA(B,OP,"MANIERE")_" "_$$^%QSCALVA(B,OP,"OUTIL")
 D PLACER^%PBPZPR(PORT,TERM,TAILLE,4*L,LI*H,LIB)
 
 D PLACER^%PBPZPR(PORT,TERM,TAILLE,165E-1*L,LI*H,$J($$^%QSCALVA(B,OP,CATT),5,4))
 
 S COR=$O(@COM@("")),LI=LI+PAS
 F J=0:0 Q:COR=""  D CORC S COR=$O(@COM@(COR)),LI=LI+PAS
 K @(COM)
 
 
OU I OUT,TYPO=2 D OUT(B,OP,"OUTIL",TYPO,.EXOUTIL,.LIN)
 I OUT,TYPO=2 D OUT(B,OP,"OUTILLAGE",TYPO,.EXOUTIL,.LIN)
 I OUT,TYPO=0 D OUT(B,OP,"OUTIL",TYPO,.EXOUTIL,.LIN)
 I OUT,TYPO=0 D OUT(B,OP,"OUTILLAGE",TYPO,.EXOUTIL,.LIN)
 I '(NOMEN) Q 0
 
BES K @(BESOIN)
 D MVG^%QSCALVA(B,OP,LBESOIN,BESOIN,.TYP)
 
 I TYPO'=1 S EXNOMEN=EXNOMEN!@BESOIN Q 0
 S COR=$O(@BESOIN@(""))
 F J=0:0 Q:COR=""  Q:LIN>26  D BESOIN S COR=$O(@BESOIN@(COR)),LIN=LIN+5E-1
 Q 0
OUT(B,OP,ATT,TYPO,EXOUTIL,LIN) 
 N TEMP,OUTIL,TYP,COR
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"OUT")
 S OUTIL=$$CONCAS^%QZCHAD(TEMP,"OUTIL")
 K @(TEMP)
 D MVG^%QSCALVA(B,OP,ATT,OUTIL,.TYP)
 
 I TYPO'=2 S EXOUTIL=EXOUTIL!@OUTIL Q
 S COR=$O(@OUTIL@(""))
 F J=0:0 Q:COR=""  Q:LIN>26  D OUTIL S COR=$O(@OUTIL@(COR)),LIN=LIN+5E-1
 Q
OUTIL N NLIEN,CO,BOUT
 
 
 S CO=@OUTIL@(COR)
 S BOUT="OUTILLAGE"
 
 D PLACER^%PBPZPR(PORT,TERM,9,15E-1*L,LIN*H,$$^%QSCALVA(BOUT,CO,"REFERENCE"))
 
 D PLACER^%PBPZPR(PORT,TERM,9,6*L,LIN*H,CO)
 Q
BESOIN N NLIEN
 
 
 S CO=@BESOIN@(COR)
 S NLIEN=$$REFLIEN^%QSGES21(OP,LBESOIN,CO)
 
 D PLACER^%PBPZPR(PORT,TERM,9,15E-1*L,LIN*H,$$^%QSCALVA(BB,CO,"NOM"))
 D PLACER^%PBPZPR(PORT,TERM,9,6*L,LIN*H,CO)
 S LIB=$$^%QSCALVA(LIENI,NLIEN,"QUANTITE")
 D PLACER^%PBPZPR(PORT,TERM,9,17*L,LIN*H,$S(LIB="":0,1:LIB))
 Q
 
CORC S CO=@COM@(COR)
 D PLACER^%PBPZPR(PORT,TERM,3,4*L,LI*H,CO)
 Q
 
CONCL(RETU,ETU,NOMEN,POSTE,PORT,TERM) 
 N TAILLE,H,L,EPA,TAILLE1
 S (H,L)=1
 S TAILLE=11
 S TAILLE1=10
 S EPA=3E-1
 D PLACER^%PBPZPR(PORT,TERM,TAILLE,5E-1*L,27*H,$$^%QZCHW("Concession")_" :")
 D HACHURER^%PBPZPR(PORT,TERM,EPA,5E-1*L,265E-1*H,5*L,7E-1*H)
 D PLACER^%PBPZPR(PORT,TERM,TAILLE1,35E-1*L,27*H,$J($$^%QSCALVA("L0",POSTE,"CONCESSION"),2,2)_" %")
 
 D PLACER^%PBPZPR(PORT,TERM,TAILLE,85E-1*L,27*H,$$^%QZCHW("Effectif")_" :")
 D HACHURER^%PBPZPR(PORT,TERM,EPA,8*L,265E-1*H,45E-1*L,7E-1*H)
 D PLACER^%PBPZPR(PORT,TERM,TAILLE1,11*L,27*H,$$^%QSCALVA("L0",POSTE,"EFFECTIF.POSTE"))
 
 D PLACER^%PBPZPR(PORT,TERM,TAILLE,155E-1*L,27*H,$$^%QZCHW("Total")_" :")
 D HACHURER^%PBPZPR(PORT,TERM,EPA,155E-1*L,265E-1*H,45E-1*L,7E-1*H)
 D PLACER^%PBPZPR(PORT,TERM,TAILLE1,175E-1*L,27*H,$$^%QSCALVA("L0",POSTE,"TEMPS.PAR.OPERATEUR"))
 Q

