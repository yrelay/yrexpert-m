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

;%DLNOMG^INT^1^59547,73868^0
DLNOMG ;
 
 
 
 
 
 
 
 
 
INIT 
 S LIENGA=$$AG^%DLCON2
 S ATCHARG=$$CHARGAR^%DLCON2
 S ATMACH=$$MACHINE^%DLCON2
 S EXART=$$RART^%DLCON2
 S QUANTI=$$QUANTITE^%DLCON2
 S OPMOD=OPM
 S ERR=0
 S LIEN=$$LINV^%DLCON2
 S DUFAB=$$DUFAB^%DLCON2
 I DUFAB="" S ERR=23 Q
 S TEMPL=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 K @(TEMPL)
 S LISREST=$$CONCAS^%QZCHAD(TEMPL,"AFFICHE")
 S OPMODT=$$CONCAS^%QZCHAD(TEMPL,"RES.TOT")
 S GLNOM=$$CONCAS^%QZCHAD(TEMPL,"NOMEN")
 S RESST=$$CONCAS^%QZCHAD(TEMPL,"RESSOU")
 S LLIST=$$CONCAS^%QZCHAD(TEMPL,"LISTE.FILS")
 S GREJAL1=$$CONCAS^%QZCHAD(TEMPL,"REJAL1")
 S GREJAL2=$$CONCAS^%QZCHAD(TEMPL,"REJAL2")
 S DESOP=$$CONCAS^%QZCHAD(TEMPL,"DESC.OPER")
 S DESOPT=$$CONCAS^%QZCHAD(TEMPL,"DESC.OPER.TEM")
 S JALON=$$CONCAS^%QZCHAD(TEMPL,"JALON")
 S JALONT=$$CONCAS^%QZCHAD(TEMPL,"JALON.TEM")
 S REGIMAC=$$CONCAS^%QZCHAD(TEMPL,"REG.CAL")
 S GREJ1=$E(GREJAL1,1,$L(GREJAL1)-1)
 S REPLIEN=$$LIENI^%QSGEL3
 S INVLIEN=$$LIENI^%QSGEL2(REPA,REPA,LIEN,4)
 I INVLIEN="" S ERR=24 Q
 S RESOB=$$CONCAS^%QZCHAD(GLNOM,"OBJ")
 S RENOM=$$CONCAS^%QZCHAD(GLNOM,"NOM")
 S OPMOD2=$E(OPMOD,1,$L(OPMOD)-1)
 S RESST2=$E(RESST,1,$L(RESST)-1)
 S OPMODT2=$E(OPMODT,1,$L(OPMODT)-1)
 S NTRT=0,DATDUJ=$P($H,","),ERRNONBL=0
 Q
 
 
 
AFF(R,IN,A,V,OR) 
 D:MODEX'=1 PA^%QSGESTI(R,IN,A,V,OR)
 D:MODEX=2 STATT^%TLBAATT(R,IN,A,V,OR,"AJOUT")
 D:MODAF'=0 ADD^%TLIFEN("ATT",IN_" : "_A_"<--"_V)
 Q
 
 
 
 
INSART(ART,LIB,DA,DA2,DA3) 
 N NR
 S NR=$S($D(@RES):@RES,1:0)
 S NR=NR+1
 S @RES@(NR)="   ",NR=NR+1
 S @RES@(NR)=EXART_" "_ART
 S NR=NR+1
 S @RES@(NR)=$TR($J(" ",$L(@RES@(NR-1)))," ","-")
 S NR=NR+1
 S @RES@(NR)=""
 G:SENS=-1 INSART1
 S NR=NR+1
 S @RES@(NR)="   "_$$^%QZCHW("Fabrication")_" : "_$$DATENO3^%QMDATE(DA)
 I DA2'="" S NR=NR+1,@RES@(NR)="   "_$$^%QZCHW("Delais supplementaires")_" : "_$$DATENO3^%QMDATE(DA2)
 I DA3'="" S NR=NR+1,@RES@(NR)="   "_$$^%QZCHW(LIB)_" : "_$$DATENO3^%QMDATE(DA3)
 G INSART2
INSART1 I DA3'="" S NR=NR+1,@RES@(NR)="   "_$$^%QZCHW(LIB)_" : "_$$DATENO3^%QMDATE(DA3)
 I DA2'="" S NR=NR+1,@RES@(NR)="   "_$$^%QZCHW("Delais supplementaires")_" : "_$$DATENO3^%QMDATE(DA2)
 S NR=NR+1
 S @RES@(NR)="   "_$$^%QZCHW("Fabrication")_" : "_$$DATENO3^%QMDATE(DA)
INSART2 S @RES=NR
 S @OPMOD@(NTRT)=ART
 S @OPMOD@(NTRT,1)=NIVE
 S @OPMOD@(NTRT,2)=DA
 Q
 
 
 
 
INSAR2(LIB,DA2,DA3) 
 N NR
 S NR=$S($D(@RES):@RES,1:0)
 G:SENS=-1 INSAR21
 I DA2'="" S NR=NR+1,@RES@(NR)="   "_$$^%QZCHW("Delais supplementaires")_" : "_$$DATENO3^%QMDATE(DA2)
 I DA3'="" S NR=NR+1,@RES@(NR)="   "_$$^%QZCHW(LIB)_" : "_$$DATENO3^%QMDATE(DA3)
 G INSAR22
INSAR21 I DA3'="" S NR=NR+1,@RES@(NR)="   "_$$^%QZCHW(LIB)_" : "_$$DATENO3^%QMDATE(DA3)
 I DA2'="" S NR=NR+1,@RES@(NR)="   "_$$^%QZCHW("Delais supplementaires")_" : "_$$DATENO3^%QMDATE(DA2)
INSAR22 S @RES=NR
 Q
 
 
 
 
RECOP(GLN,GL) 
 N CPT,NIV,SNIV
 S CPT=$S($D(@GL):@GL,1:0),NIV=""
RECNIV S NIV=$O(@GLN@(NIV))
 I NIV="" S @GL=CPT Q
 S CPT=CPT+1
 S @GL@(CPT)=@GLN@(NIV)
 G RECNIV
 
 
 
 
TRI(GLN,GL) 
 N G,NIV,SNIV,CPT,DA,GLN2,GL2
 K @(GL)
 S GLN2=$E(GLN,1,$L(GLN)-1)
 S GL2=$E(GL,1,$L(GL)-1)
 S NIV=""
BNIVT S NIV=$O(@GLN@(NIV))
 G:NIV="" RECOT
 S SNIV=""
BSNIVT S SNIV=$O(@GLN@(NIV,SNIV))
 G:SNIV="" BNIVT
 S G(@GLN@(NIV,SNIV,2),NIV,SNIV)=""
 G BSNIVT
 
RECOT S CPT=1,DA=""
BRECOT S DA=$O(G(DA))
 Q:DA=""
 S NIV=""
BRECON S NIV=$O(G(DA,NIV))
 G:NIV="" BRECOT
 S SNIV=""
BRECOSN S SNIV=$O(G(DA,NIV,SNIV))
 G:SNIV="" BRECON
 D ADR^%QCAGLC(GLN2_","_NIV_","_SNIV,GL2_","_CPT)
 S CPT=CPT+1
 G BRECOSN
 
 
 
NOMENER(RESST) 
 N NIV,RESST2
 S RESST2=$E(RESST,1,$L(RESST)-1)
 S NIV=""
BNOMER S NIV=$O(@RESST@(NIV))
 Q:NIV=""
 K ^RESSOUR($J)
 D ADR^%QCAGLC(RESST2_","_NIV,"^RESSOUR("_$J)
 D RETSOU^%DLCAP2
 G BNOMER
 ;
 ;

