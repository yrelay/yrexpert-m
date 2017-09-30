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

;%QMECTRA^INT^1^59547,73878^0
QMECTRA ;
 
ATT(A,V) 
 Q
 
INIRES(NOEUD) 
 N TEMP,TYP,GLOT,I,TEMPP,GLORES,IREM,TEMPR,PROFAR,BONMAL,LIEN
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 S GLOT=$$CONCAS^%QZCHAD(TEMP,"GLOT")
 S @TEMP=$S($D(@TEMP)#10:@TEMP,1:0)+1,TEMP=$$CONCAS^%QZCHAD(TEMP,@TEMP)
 K @(TEMP)
 S TEMPP=$$CONCAS^%QZCHAD(TEMP,"A.TRAITER")
 S TEMPR=$$CONCAS^%QZCHAD(TEMP,"RESEAU")
 S TEMP=$$CONCAS^%QZCHAD(TEMP,"PILE.PARCOURS")
 S IREM=$$^%QSCALVA("ATTRIBUT","EVALUATION.INTERACTIVE","REMANENCE.INITIALE")
 I IREM="" S IREM=1
 S @TEMPP@(NOEUD)=""
BCATRT 
 S NOEUD=$O(@TEMPP@("")) I NOEUD="" G FINIRS
 K @(GLOT)
 D MVG^%QSCALVA(REPNOE,NOEUD,LIENOE,GLOT,.TYP)
 S I=""
BCSUIV S I=$O(@GLOT@(I)) I I="" G FINBCS
 S LIEN=$$REFLIEN^%QSGES21(NOEUD,LIENOE,@GLOT@(I)) I LIEN="" G BCSUIV
 S BONMAL=$$^%QSCALIN($$LIENI^%QSGEL3,LIEN,"REMANENCE",1)
 I BONMAL="" S BONMAL=IREM
 S @TEMPR@(NOEUD,BONMAL,@GLOT@(I))=0
 S @TEMPR@(NOEUD,BONMAL,@GLOT@(I),"INDIVIDU.LIEN")=LIEN
 I '($D(@TEMPR@(@GLOT@(I)))) S @TEMPP@(@GLOT@(I))=""
 G BCSUIV
FINBCS 
 K @TEMPP@(NOEUD) S @TEMP=0
 G BCATRT
FINIRS 
 Q
 
 
STORES 
 N TEMP,SOUR,DEST,GLORES,TEMPR,BONMAL,LIEN
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 S TEMPR=$$CONCAS^%QZCHAD(TEMP,@TEMP_","_"RESEAU")
 S SOUR=""
BCSOUR 
 S SOUR=$O(@TEMPR@(SOUR)) I SOUR="" G FBCSOU
 S BONMAL=""
BCBONM 
 S BONMAL=$O(@TEMPR@(SOUR,BONMAL)) I BONMAL="" G BCSOUR
 S DEST=""
BCDEST 
 S DEST=$O(@TEMPR@(SOUR,BONMAL,DEST)) I DEST="" G BCBONM
 D PA^%QSGESTI($$LIENI^%QSGEL3,@TEMPR@(SOUR,BONMAL,DEST,"INDIVIDU.LIEN"),"REMANENCE",$$^%QSCALIN($$LIENI^%QSGEL3,@TEMPR@(SOUR,BONMAL,DEST,"INDIVIDU.LIEN"),"REMANENCE",1)+@TEMPR@(SOUR,BONMAL,DEST),1)
 G BCDEST
FBCSOU 
 K @TEMP@(@TEMP) S @TEMP=@TEMP-1 I @TEMP=0 K @(TEMP)
 Q
 
 
INLISR 
 S PROFAR=PROFAR+1,@TEMP=PROFAR
 S @TEMP@(PROFAR,"SOURCE")=NOEUD,@TEMP@(PROFAR,"BONUS.MALUS")=""
 S @TEMP@(PROFAR,"PRECEDENT")=""
 I '($D(@TEMPR@(NOEUD))) S LISVID=1,NOEUD=""
 Q
FILISR 
 K @TEMP@(PROFAR)
 S PROFAR=PROFAR-1,@TEMP=PROFAR
 I PROFAR=0 S LISVID=1,NOEUD=""
 Q
 
CDSVR(NOEUD) 
 N TEMP,LIEN,GLO,TYP,TETE,POS,EXP,I,TEMPR,NOESOU,NOEPRE,PROFAR
 N DELTAB,DELTAM,BONMAL,LISVID,MODAF,MODEX
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 S GLO=$$CONCAS^%QZCHAD(TEMP,"GLO")
 S TEMP=$$CONCAS^%QZCHAD(TEMP,@TEMP)
 S TEMPR=$$CONCAS^%QZCHAD(TEMP,"RESEAU")
 S TEMP=$$CONCAS^%QZCHAD(TEMP,"PILE.PARCOURS")
 S DELTAB=$$^%QSCALVA("ATTRIBUT","EVALUATION.INTERACTIVE","BONUS.DELTA")
 S DELTAM=$$^%QSCALVA("ATTRIBUT","EVALUATION.INTERACTIVE","MALUS.DELTA")
 S:DELTAB="" DELTAB=1 S:DELTAM="" DELTAM=-5
 S MODAF=0,MODEX=0,LISVID=0
 S PROFAR=@TEMP
 D INLISR I LISVID S NOEUD="" Q
DEBCDS 
 S NOEUD=""
 S NOESOU=@TEMP@(PROFAR,"SOURCE"),NOEPRE=@TEMP@(PROFAR,"PRECEDENT"),BONMAL=@TEMP@(PROFAR,"BONUS.MALUS")
 D ADDJOUR^%QMECEVA(PROFAR,NOESOU)
IBNOSV 
 I BONMAL'="" G BCNOSV
BCBOSV 
 S BONMAL=$ZP(@TEMPR@(NOESOU,BONMAL))
 I BONMAL'="" S NOEPRE="" G BCNOSV
 D FILISR I LISVID Q
 G DEBCDS
BCNOSV 
 S NOEPRE=$O(@TEMPR@(NOESOU,BONMAL,NOEPRE))
 I NOEPRE="" G BCBOSV
 S NOEUD=NOEPRE
FBNOSV 
 S @TEMP@(PROFAR,"BONUS.MALUS")=BONMAL,@TEMP@(PROFAR,"PRECEDENT")=NOEUD
 S LIEN=@TEMPR@(NOESOU,BONMAL,NOEUD,"INDIVIDU.LIEN")
 K @(GLO)
 D MVG^%QSCALVA($$LIENI^%QSGEL3,LIEN,"CONDITION.TRANSITION",GLO,.TYP)
 S I=""
BCONDI 
 S I=$O(@GLO@(I))
 I I="" G CDTROU
 S TETE=@$$ADRESSE^%QMEBCDT@(LIEN,"CONDITION.TRANSITION",I)
 S EXP=$$SUBST^%ANARBR2(TETE,.CXT,"ATT^%QMECTRA",.POS)
 I (EXP=1)&(POS=1) G BCONDI
SETMAL 
 S @TEMPR@(NOESOU,BONMAL,NOEUD)=@TEMPR@(NOESOU,BONMAL,NOEUD)+DELTAM
 G BCNOSV
CDTROU 
 S @TEMPR@(NOESOU,BONMAL,NOEUD)=@TEMPR@(NOESOU,BONMAL,NOEUD)+DELTAB
 D PA^%QSGESTI($$LIENI^%QSGEL3,LIEN,"NOMBRE.PASSAGES",$$^%QSCALIN($$LIENI^%QSGEL3,LIEN,"NOMBRE.PASSAGES",1)+1,1)
 Q
 
 
ADRESSE() 
 Q "^["""_QUI_"""]RQSGLO(""QMECTRA"",""RESEAU"")"
ADRVISU() 
 N TEMP,TEMPR,SOUR,BONMAL,DEST
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 S TEMP=$$CONCAS^%QZCHAD(TEMP,@TEMP)
 S TEMPR=$$CONCAS^%QZCHAD(TEMP,"RESEAU")
 S TEMP=$$CONCAS^%QZCHAD(TEMP,"RESEAU.VISUALISATION")
 I $D(@TEMP) G FINVIS
 S SOUR=""
BCSOVI 
 S SOUR=$O(@TEMPR@(SOUR)) I SOUR="" G FINVIS
 S BONMAL=""
BCBOVI 
 S BONMAL=$O(@TEMPR@(SOUR,BONMAL)) I BONMAL="" G BCSOVI
 S DEST=""
BCDEVI 
 S DEST=$O(@TEMPR@(SOUR,BONMAL,DEST)) I DEST="" G BCBOVI
 S @TEMP@(SOUR,DEST)=$$^%QSCALIN($$LIENI^%QSGEL3,@TEMPR@(SOUR,BONMAL,DEST,"INDIVIDU.LIEN"),"NOMBRE.PASSAGES",1)+0
 G BCDEVI
FINVIS 
 Q TEMP

